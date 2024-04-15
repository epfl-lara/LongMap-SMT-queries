; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64736 () Bool)

(assert start!64736)

(declare-fun b!730960 () Bool)

(declare-fun res!491315 () Bool)

(declare-fun e!409006 () Bool)

(assert (=> b!730960 (=> (not res!491315) (not e!409006))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41202 0))(
  ( (array!41203 (arr!19721 (Array (_ BitVec 32) (_ BitVec 64))) (size!20142 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41202)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730960 (= res!491315 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19721 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!491316 () Bool)

(declare-fun e!409004 () Bool)

(assert (=> start!64736 (=> (not res!491316) (not e!409004))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64736 (= res!491316 (validMask!0 mask!3328))))

(assert (=> start!64736 e!409004))

(assert (=> start!64736 true))

(declare-fun array_inv!15604 (array!41202) Bool)

(assert (=> start!64736 (array_inv!15604 a!3186)))

(declare-fun b!730961 () Bool)

(declare-fun res!491313 () Bool)

(assert (=> b!730961 (=> (not res!491313) (not e!409004))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730961 (= res!491313 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730962 () Bool)

(declare-fun e!409005 () Bool)

(declare-fun e!409010 () Bool)

(assert (=> b!730962 (= e!409005 e!409010)))

(declare-fun res!491320 () Bool)

(assert (=> b!730962 (=> res!491320 e!409010)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730962 (= res!491320 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323809 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730962 (= lt!323809 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730963 () Bool)

(declare-fun res!491318 () Bool)

(declare-fun e!409008 () Bool)

(assert (=> b!730963 (=> (not res!491318) (not e!409008))))

(declare-datatypes ((List!13762 0))(
  ( (Nil!13759) (Cons!13758 (h!14818 (_ BitVec 64)) (t!20068 List!13762)) )
))
(declare-fun arrayNoDuplicates!0 (array!41202 (_ BitVec 32) List!13762) Bool)

(assert (=> b!730963 (= res!491318 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13759))))

(declare-fun b!730964 () Bool)

(declare-fun e!409012 () Bool)

(assert (=> b!730964 (= e!409006 e!409012)))

(declare-fun res!491317 () Bool)

(assert (=> b!730964 (=> (not res!491317) (not e!409012))))

(declare-datatypes ((SeekEntryResult!7318 0))(
  ( (MissingZero!7318 (index!31640 (_ BitVec 32))) (Found!7318 (index!31641 (_ BitVec 32))) (Intermediate!7318 (undefined!8130 Bool) (index!31642 (_ BitVec 32)) (x!62623 (_ BitVec 32))) (Undefined!7318) (MissingVacant!7318 (index!31643 (_ BitVec 32))) )
))
(declare-fun lt!323813 () SeekEntryResult!7318)

(declare-fun lt!323808 () SeekEntryResult!7318)

(assert (=> b!730964 (= res!491317 (= lt!323813 lt!323808))))

(declare-fun lt!323811 () array!41202)

(declare-fun lt!323807 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41202 (_ BitVec 32)) SeekEntryResult!7318)

(assert (=> b!730964 (= lt!323808 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323807 lt!323811 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730964 (= lt!323813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323807 mask!3328) lt!323807 lt!323811 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!730964 (= lt!323807 (select (store (arr!19721 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730964 (= lt!323811 (array!41203 (store (arr!19721 a!3186) i!1173 k0!2102) (size!20142 a!3186)))))

(declare-fun lt!323805 () SeekEntryResult!7318)

(declare-fun e!409009 () Bool)

(declare-fun b!730965 () Bool)

(assert (=> b!730965 (= e!409009 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!323805))))

(declare-fun b!730966 () Bool)

(declare-fun res!491319 () Bool)

(assert (=> b!730966 (=> (not res!491319) (not e!409008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41202 (_ BitVec 32)) Bool)

(assert (=> b!730966 (= res!491319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730967 () Bool)

(assert (=> b!730967 (= e!409004 e!409008)))

(declare-fun res!491328 () Bool)

(assert (=> b!730967 (=> (not res!491328) (not e!409008))))

(declare-fun lt!323812 () SeekEntryResult!7318)

(assert (=> b!730967 (= res!491328 (or (= lt!323812 (MissingZero!7318 i!1173)) (= lt!323812 (MissingVacant!7318 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41202 (_ BitVec 32)) SeekEntryResult!7318)

(assert (=> b!730967 (= lt!323812 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730968 () Bool)

(declare-fun res!491323 () Bool)

(assert (=> b!730968 (=> res!491323 e!409010)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41202 (_ BitVec 32)) SeekEntryResult!7318)

(assert (=> b!730968 (= res!491323 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) (Found!7318 j!159))))))

(declare-fun b!730969 () Bool)

(declare-fun e!409007 () Bool)

(declare-fun e!409011 () Bool)

(assert (=> b!730969 (= e!409007 e!409011)))

(declare-fun res!491311 () Bool)

(assert (=> b!730969 (=> (not res!491311) (not e!409011))))

(declare-fun lt!323810 () SeekEntryResult!7318)

(assert (=> b!730969 (= res!491311 (= (seekEntryOrOpen!0 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!323810))))

(assert (=> b!730969 (= lt!323810 (Found!7318 j!159))))

(declare-fun b!730970 () Bool)

(declare-fun res!491325 () Bool)

(assert (=> b!730970 (=> (not res!491325) (not e!409006))))

(assert (=> b!730970 (= res!491325 e!409009)))

(declare-fun c!80199 () Bool)

(assert (=> b!730970 (= c!80199 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730971 () Bool)

(assert (=> b!730971 (= e!409010 (or (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!323809 #b00000000000000000000000000000000) (bvslt lt!323809 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun b!730972 () Bool)

(declare-fun res!491326 () Bool)

(assert (=> b!730972 (=> (not res!491326) (not e!409004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730972 (= res!491326 (validKeyInArray!0 k0!2102))))

(declare-fun b!730973 () Bool)

(declare-fun res!491312 () Bool)

(assert (=> b!730973 (=> (not res!491312) (not e!409008))))

(assert (=> b!730973 (= res!491312 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20142 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20142 a!3186))))))

(declare-fun b!730974 () Bool)

(assert (=> b!730974 (= e!409012 (not e!409005))))

(declare-fun res!491324 () Bool)

(assert (=> b!730974 (=> res!491324 e!409005)))

(get-info :version)

(assert (=> b!730974 (= res!491324 (or (not ((_ is Intermediate!7318) lt!323808)) (bvsge x!1131 (x!62623 lt!323808))))))

(assert (=> b!730974 e!409007))

(declare-fun res!491322 () Bool)

(assert (=> b!730974 (=> (not res!491322) (not e!409007))))

(assert (=> b!730974 (= res!491322 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24926 0))(
  ( (Unit!24927) )
))
(declare-fun lt!323806 () Unit!24926)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24926)

(assert (=> b!730974 (= lt!323806 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730975 () Bool)

(declare-fun res!491314 () Bool)

(assert (=> b!730975 (=> (not res!491314) (not e!409004))))

(assert (=> b!730975 (= res!491314 (validKeyInArray!0 (select (arr!19721 a!3186) j!159)))))

(declare-fun b!730976 () Bool)

(declare-fun res!491321 () Bool)

(assert (=> b!730976 (=> (not res!491321) (not e!409004))))

(assert (=> b!730976 (= res!491321 (and (= (size!20142 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20142 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20142 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730977 () Bool)

(assert (=> b!730977 (= e!409009 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) (Found!7318 j!159)))))

(declare-fun b!730978 () Bool)

(assert (=> b!730978 (= e!409011 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!323810))))

(declare-fun b!730979 () Bool)

(assert (=> b!730979 (= e!409008 e!409006)))

(declare-fun res!491327 () Bool)

(assert (=> b!730979 (=> (not res!491327) (not e!409006))))

(assert (=> b!730979 (= res!491327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19721 a!3186) j!159) mask!3328) (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!323805))))

(assert (=> b!730979 (= lt!323805 (Intermediate!7318 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64736 res!491316) b!730976))

(assert (= (and b!730976 res!491321) b!730975))

(assert (= (and b!730975 res!491314) b!730972))

(assert (= (and b!730972 res!491326) b!730961))

(assert (= (and b!730961 res!491313) b!730967))

(assert (= (and b!730967 res!491328) b!730966))

(assert (= (and b!730966 res!491319) b!730963))

(assert (= (and b!730963 res!491318) b!730973))

(assert (= (and b!730973 res!491312) b!730979))

(assert (= (and b!730979 res!491327) b!730960))

(assert (= (and b!730960 res!491315) b!730970))

(assert (= (and b!730970 c!80199) b!730965))

(assert (= (and b!730970 (not c!80199)) b!730977))

(assert (= (and b!730970 res!491325) b!730964))

(assert (= (and b!730964 res!491317) b!730974))

(assert (= (and b!730974 res!491322) b!730969))

(assert (= (and b!730969 res!491311) b!730978))

(assert (= (and b!730974 (not res!491324)) b!730962))

(assert (= (and b!730962 (not res!491320)) b!730968))

(assert (= (and b!730968 (not res!491323)) b!730971))

(declare-fun m!683861 () Bool)

(assert (=> b!730979 m!683861))

(assert (=> b!730979 m!683861))

(declare-fun m!683863 () Bool)

(assert (=> b!730979 m!683863))

(assert (=> b!730979 m!683863))

(assert (=> b!730979 m!683861))

(declare-fun m!683865 () Bool)

(assert (=> b!730979 m!683865))

(declare-fun m!683867 () Bool)

(assert (=> b!730962 m!683867))

(assert (=> b!730969 m!683861))

(assert (=> b!730969 m!683861))

(declare-fun m!683869 () Bool)

(assert (=> b!730969 m!683869))

(assert (=> b!730977 m!683861))

(assert (=> b!730977 m!683861))

(declare-fun m!683871 () Bool)

(assert (=> b!730977 m!683871))

(declare-fun m!683873 () Bool)

(assert (=> b!730961 m!683873))

(assert (=> b!730968 m!683861))

(assert (=> b!730968 m!683861))

(assert (=> b!730968 m!683871))

(declare-fun m!683875 () Bool)

(assert (=> b!730974 m!683875))

(declare-fun m!683877 () Bool)

(assert (=> b!730974 m!683877))

(declare-fun m!683879 () Bool)

(assert (=> b!730966 m!683879))

(assert (=> b!730975 m!683861))

(assert (=> b!730975 m!683861))

(declare-fun m!683881 () Bool)

(assert (=> b!730975 m!683881))

(declare-fun m!683883 () Bool)

(assert (=> b!730964 m!683883))

(declare-fun m!683885 () Bool)

(assert (=> b!730964 m!683885))

(assert (=> b!730964 m!683883))

(declare-fun m!683887 () Bool)

(assert (=> b!730964 m!683887))

(declare-fun m!683889 () Bool)

(assert (=> b!730964 m!683889))

(declare-fun m!683891 () Bool)

(assert (=> b!730964 m!683891))

(declare-fun m!683893 () Bool)

(assert (=> b!730960 m!683893))

(declare-fun m!683895 () Bool)

(assert (=> b!730972 m!683895))

(assert (=> b!730978 m!683861))

(assert (=> b!730978 m!683861))

(declare-fun m!683897 () Bool)

(assert (=> b!730978 m!683897))

(declare-fun m!683899 () Bool)

(assert (=> b!730963 m!683899))

(declare-fun m!683901 () Bool)

(assert (=> b!730967 m!683901))

(assert (=> b!730965 m!683861))

(assert (=> b!730965 m!683861))

(declare-fun m!683903 () Bool)

(assert (=> b!730965 m!683903))

(declare-fun m!683905 () Bool)

(assert (=> start!64736 m!683905))

(declare-fun m!683907 () Bool)

(assert (=> start!64736 m!683907))

(check-sat (not b!730963) (not start!64736) (not b!730962) (not b!730978) (not b!730979) (not b!730974) (not b!730968) (not b!730964) (not b!730972) (not b!730965) (not b!730961) (not b!730967) (not b!730966) (not b!730975) (not b!730969) (not b!730977))
(check-sat)
(get-model)

(declare-fun b!731118 () Bool)

(declare-fun e!409087 () SeekEntryResult!7318)

(declare-fun e!409085 () SeekEntryResult!7318)

(assert (=> b!731118 (= e!409087 e!409085)))

(declare-fun lt!323873 () (_ BitVec 64))

(declare-fun c!80212 () Bool)

(assert (=> b!731118 (= c!80212 (or (= lt!323873 (select (arr!19721 a!3186) j!159)) (= (bvadd lt!323873 lt!323873) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731119 () Bool)

(declare-fun lt!323872 () SeekEntryResult!7318)

(assert (=> b!731119 (and (bvsge (index!31642 lt!323872) #b00000000000000000000000000000000) (bvslt (index!31642 lt!323872) (size!20142 a!3186)))))

(declare-fun e!409084 () Bool)

(assert (=> b!731119 (= e!409084 (= (select (arr!19721 a!3186) (index!31642 lt!323872)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731120 () Bool)

(assert (=> b!731120 (and (bvsge (index!31642 lt!323872) #b00000000000000000000000000000000) (bvslt (index!31642 lt!323872) (size!20142 a!3186)))))

(declare-fun res!491444 () Bool)

(assert (=> b!731120 (= res!491444 (= (select (arr!19721 a!3186) (index!31642 lt!323872)) (select (arr!19721 a!3186) j!159)))))

(assert (=> b!731120 (=> res!491444 e!409084)))

(declare-fun e!409086 () Bool)

(assert (=> b!731120 (= e!409086 e!409084)))

(declare-fun b!731121 () Bool)

(assert (=> b!731121 (= e!409085 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19721 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731122 () Bool)

(assert (=> b!731122 (= e!409085 (Intermediate!7318 false index!1321 x!1131))))

(declare-fun b!731123 () Bool)

(assert (=> b!731123 (and (bvsge (index!31642 lt!323872) #b00000000000000000000000000000000) (bvslt (index!31642 lt!323872) (size!20142 a!3186)))))

(declare-fun res!491445 () Bool)

(assert (=> b!731123 (= res!491445 (= (select (arr!19721 a!3186) (index!31642 lt!323872)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731123 (=> res!491445 e!409084)))

(declare-fun b!731125 () Bool)

(assert (=> b!731125 (= e!409087 (Intermediate!7318 true index!1321 x!1131))))

(declare-fun b!731126 () Bool)

(declare-fun e!409083 () Bool)

(assert (=> b!731126 (= e!409083 e!409086)))

(declare-fun res!491443 () Bool)

(assert (=> b!731126 (= res!491443 (and ((_ is Intermediate!7318) lt!323872) (not (undefined!8130 lt!323872)) (bvslt (x!62623 lt!323872) #b01111111111111111111111111111110) (bvsge (x!62623 lt!323872) #b00000000000000000000000000000000) (bvsge (x!62623 lt!323872) x!1131)))))

(assert (=> b!731126 (=> (not res!491443) (not e!409086))))

(declare-fun b!731124 () Bool)

(assert (=> b!731124 (= e!409083 (bvsge (x!62623 lt!323872) #b01111111111111111111111111111110))))

(declare-fun d!99417 () Bool)

(assert (=> d!99417 e!409083))

(declare-fun c!80213 () Bool)

(assert (=> d!99417 (= c!80213 (and ((_ is Intermediate!7318) lt!323872) (undefined!8130 lt!323872)))))

(assert (=> d!99417 (= lt!323872 e!409087)))

(declare-fun c!80214 () Bool)

(assert (=> d!99417 (= c!80214 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99417 (= lt!323873 (select (arr!19721 a!3186) index!1321))))

(assert (=> d!99417 (validMask!0 mask!3328)))

(assert (=> d!99417 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!323872)))

(assert (= (and d!99417 c!80214) b!731125))

(assert (= (and d!99417 (not c!80214)) b!731118))

(assert (= (and b!731118 c!80212) b!731122))

(assert (= (and b!731118 (not c!80212)) b!731121))

(assert (= (and d!99417 c!80213) b!731124))

(assert (= (and d!99417 (not c!80213)) b!731126))

(assert (= (and b!731126 res!491443) b!731120))

(assert (= (and b!731120 (not res!491444)) b!731123))

(assert (= (and b!731123 (not res!491445)) b!731119))

(declare-fun m!684005 () Bool)

(assert (=> b!731123 m!684005))

(assert (=> b!731119 m!684005))

(declare-fun m!684007 () Bool)

(assert (=> d!99417 m!684007))

(assert (=> d!99417 m!683905))

(assert (=> b!731120 m!684005))

(assert (=> b!731121 m!683867))

(assert (=> b!731121 m!683867))

(assert (=> b!731121 m!683861))

(declare-fun m!684009 () Bool)

(assert (=> b!731121 m!684009))

(assert (=> b!730965 d!99417))

(declare-fun d!99419 () Bool)

(assert (=> d!99419 (= (validKeyInArray!0 (select (arr!19721 a!3186) j!159)) (and (not (= (select (arr!19721 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19721 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!730975 d!99419))

(declare-fun b!731139 () Bool)

(declare-fun e!409095 () SeekEntryResult!7318)

(assert (=> b!731139 (= e!409095 Undefined!7318)))

(declare-fun e!409094 () SeekEntryResult!7318)

(declare-fun b!731140 () Bool)

(assert (=> b!731140 (= e!409094 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19721 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731141 () Bool)

(declare-fun c!80221 () Bool)

(declare-fun lt!323879 () (_ BitVec 64))

(assert (=> b!731141 (= c!80221 (= lt!323879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409096 () SeekEntryResult!7318)

(assert (=> b!731141 (= e!409096 e!409094)))

(declare-fun b!731142 () Bool)

(assert (=> b!731142 (= e!409094 (MissingVacant!7318 resIntermediateIndex!5))))

(declare-fun b!731143 () Bool)

(assert (=> b!731143 (= e!409095 e!409096)))

(declare-fun c!80223 () Bool)

(assert (=> b!731143 (= c!80223 (= lt!323879 (select (arr!19721 a!3186) j!159)))))

(declare-fun b!731144 () Bool)

(assert (=> b!731144 (= e!409096 (Found!7318 index!1321))))

(declare-fun lt!323878 () SeekEntryResult!7318)

(declare-fun d!99421 () Bool)

(assert (=> d!99421 (and (or ((_ is Undefined!7318) lt!323878) (not ((_ is Found!7318) lt!323878)) (and (bvsge (index!31641 lt!323878) #b00000000000000000000000000000000) (bvslt (index!31641 lt!323878) (size!20142 a!3186)))) (or ((_ is Undefined!7318) lt!323878) ((_ is Found!7318) lt!323878) (not ((_ is MissingVacant!7318) lt!323878)) (not (= (index!31643 lt!323878) resIntermediateIndex!5)) (and (bvsge (index!31643 lt!323878) #b00000000000000000000000000000000) (bvslt (index!31643 lt!323878) (size!20142 a!3186)))) (or ((_ is Undefined!7318) lt!323878) (ite ((_ is Found!7318) lt!323878) (= (select (arr!19721 a!3186) (index!31641 lt!323878)) (select (arr!19721 a!3186) j!159)) (and ((_ is MissingVacant!7318) lt!323878) (= (index!31643 lt!323878) resIntermediateIndex!5) (= (select (arr!19721 a!3186) (index!31643 lt!323878)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99421 (= lt!323878 e!409095)))

(declare-fun c!80222 () Bool)

(assert (=> d!99421 (= c!80222 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99421 (= lt!323879 (select (arr!19721 a!3186) index!1321))))

(assert (=> d!99421 (validMask!0 mask!3328)))

(assert (=> d!99421 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!323878)))

(assert (= (and d!99421 c!80222) b!731139))

(assert (= (and d!99421 (not c!80222)) b!731143))

(assert (= (and b!731143 c!80223) b!731144))

(assert (= (and b!731143 (not c!80223)) b!731141))

(assert (= (and b!731141 c!80221) b!731142))

(assert (= (and b!731141 (not c!80221)) b!731140))

(assert (=> b!731140 m!683867))

(assert (=> b!731140 m!683867))

(assert (=> b!731140 m!683861))

(declare-fun m!684011 () Bool)

(assert (=> b!731140 m!684011))

(declare-fun m!684013 () Bool)

(assert (=> d!99421 m!684013))

(declare-fun m!684015 () Bool)

(assert (=> d!99421 m!684015))

(assert (=> d!99421 m!684007))

(assert (=> d!99421 m!683905))

(assert (=> b!730977 d!99421))

(declare-fun b!731153 () Bool)

(declare-fun e!409103 () Bool)

(declare-fun call!34804 () Bool)

(assert (=> b!731153 (= e!409103 call!34804)))

(declare-fun bm!34801 () Bool)

(assert (=> bm!34801 (= call!34804 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!731154 () Bool)

(declare-fun e!409104 () Bool)

(assert (=> b!731154 (= e!409104 e!409103)))

(declare-fun c!80226 () Bool)

(assert (=> b!731154 (= c!80226 (validKeyInArray!0 (select (arr!19721 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99427 () Bool)

(declare-fun res!491451 () Bool)

(assert (=> d!99427 (=> res!491451 e!409104)))

(assert (=> d!99427 (= res!491451 (bvsge #b00000000000000000000000000000000 (size!20142 a!3186)))))

(assert (=> d!99427 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!409104)))

(declare-fun b!731155 () Bool)

(declare-fun e!409105 () Bool)

(assert (=> b!731155 (= e!409103 e!409105)))

(declare-fun lt!323886 () (_ BitVec 64))

(assert (=> b!731155 (= lt!323886 (select (arr!19721 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!323887 () Unit!24926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41202 (_ BitVec 64) (_ BitVec 32)) Unit!24926)

(assert (=> b!731155 (= lt!323887 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!323886 #b00000000000000000000000000000000))))

(assert (=> b!731155 (arrayContainsKey!0 a!3186 lt!323886 #b00000000000000000000000000000000)))

(declare-fun lt!323888 () Unit!24926)

(assert (=> b!731155 (= lt!323888 lt!323887)))

(declare-fun res!491450 () Bool)

(assert (=> b!731155 (= res!491450 (= (seekEntryOrOpen!0 (select (arr!19721 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7318 #b00000000000000000000000000000000)))))

(assert (=> b!731155 (=> (not res!491450) (not e!409105))))

(declare-fun b!731156 () Bool)

(assert (=> b!731156 (= e!409105 call!34804)))

(assert (= (and d!99427 (not res!491451)) b!731154))

(assert (= (and b!731154 c!80226) b!731155))

(assert (= (and b!731154 (not c!80226)) b!731153))

(assert (= (and b!731155 res!491450) b!731156))

(assert (= (or b!731156 b!731153) bm!34801))

(declare-fun m!684017 () Bool)

(assert (=> bm!34801 m!684017))

(declare-fun m!684019 () Bool)

(assert (=> b!731154 m!684019))

(assert (=> b!731154 m!684019))

(declare-fun m!684021 () Bool)

(assert (=> b!731154 m!684021))

(assert (=> b!731155 m!684019))

(declare-fun m!684023 () Bool)

(assert (=> b!731155 m!684023))

(declare-fun m!684025 () Bool)

(assert (=> b!731155 m!684025))

(assert (=> b!731155 m!684019))

(declare-fun m!684027 () Bool)

(assert (=> b!731155 m!684027))

(assert (=> b!730966 d!99427))

(declare-fun d!99429 () Bool)

(declare-fun lt!323895 () (_ BitVec 32))

(assert (=> d!99429 (and (bvsge lt!323895 #b00000000000000000000000000000000) (bvslt lt!323895 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99429 (= lt!323895 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99429 (validMask!0 mask!3328)))

(assert (=> d!99429 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!323895)))

(declare-fun bs!20904 () Bool)

(assert (= bs!20904 d!99429))

(declare-fun m!684029 () Bool)

(assert (=> bs!20904 m!684029))

(assert (=> bs!20904 m!683905))

(assert (=> b!730962 d!99429))

(declare-fun d!99431 () Bool)

(assert (=> d!99431 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64736 d!99431))

(declare-fun d!99439 () Bool)

(assert (=> d!99439 (= (array_inv!15604 a!3186) (bvsge (size!20142 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64736 d!99439))

(declare-fun b!731184 () Bool)

(declare-fun e!409125 () SeekEntryResult!7318)

(declare-fun e!409123 () SeekEntryResult!7318)

(assert (=> b!731184 (= e!409125 e!409123)))

(declare-fun c!80236 () Bool)

(declare-fun lt!323905 () (_ BitVec 64))

(assert (=> b!731184 (= c!80236 (or (= lt!323905 lt!323807) (= (bvadd lt!323905 lt!323905) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731185 () Bool)

(declare-fun lt!323904 () SeekEntryResult!7318)

(assert (=> b!731185 (and (bvsge (index!31642 lt!323904) #b00000000000000000000000000000000) (bvslt (index!31642 lt!323904) (size!20142 lt!323811)))))

(declare-fun e!409122 () Bool)

(assert (=> b!731185 (= e!409122 (= (select (arr!19721 lt!323811) (index!31642 lt!323904)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731186 () Bool)

(assert (=> b!731186 (and (bvsge (index!31642 lt!323904) #b00000000000000000000000000000000) (bvslt (index!31642 lt!323904) (size!20142 lt!323811)))))

(declare-fun res!491463 () Bool)

(assert (=> b!731186 (= res!491463 (= (select (arr!19721 lt!323811) (index!31642 lt!323904)) lt!323807))))

(assert (=> b!731186 (=> res!491463 e!409122)))

(declare-fun e!409124 () Bool)

(assert (=> b!731186 (= e!409124 e!409122)))

(declare-fun b!731187 () Bool)

(assert (=> b!731187 (= e!409123 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!323807 lt!323811 mask!3328))))

(declare-fun b!731188 () Bool)

(assert (=> b!731188 (= e!409123 (Intermediate!7318 false index!1321 x!1131))))

(declare-fun b!731189 () Bool)

(assert (=> b!731189 (and (bvsge (index!31642 lt!323904) #b00000000000000000000000000000000) (bvslt (index!31642 lt!323904) (size!20142 lt!323811)))))

(declare-fun res!491464 () Bool)

(assert (=> b!731189 (= res!491464 (= (select (arr!19721 lt!323811) (index!31642 lt!323904)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731189 (=> res!491464 e!409122)))

(declare-fun b!731191 () Bool)

(assert (=> b!731191 (= e!409125 (Intermediate!7318 true index!1321 x!1131))))

(declare-fun b!731192 () Bool)

(declare-fun e!409121 () Bool)

(assert (=> b!731192 (= e!409121 e!409124)))

(declare-fun res!491462 () Bool)

(assert (=> b!731192 (= res!491462 (and ((_ is Intermediate!7318) lt!323904) (not (undefined!8130 lt!323904)) (bvslt (x!62623 lt!323904) #b01111111111111111111111111111110) (bvsge (x!62623 lt!323904) #b00000000000000000000000000000000) (bvsge (x!62623 lt!323904) x!1131)))))

(assert (=> b!731192 (=> (not res!491462) (not e!409124))))

(declare-fun b!731190 () Bool)

(assert (=> b!731190 (= e!409121 (bvsge (x!62623 lt!323904) #b01111111111111111111111111111110))))

(declare-fun d!99441 () Bool)

(assert (=> d!99441 e!409121))

(declare-fun c!80237 () Bool)

(assert (=> d!99441 (= c!80237 (and ((_ is Intermediate!7318) lt!323904) (undefined!8130 lt!323904)))))

(assert (=> d!99441 (= lt!323904 e!409125)))

(declare-fun c!80238 () Bool)

(assert (=> d!99441 (= c!80238 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99441 (= lt!323905 (select (arr!19721 lt!323811) index!1321))))

(assert (=> d!99441 (validMask!0 mask!3328)))

(assert (=> d!99441 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323807 lt!323811 mask!3328) lt!323904)))

(assert (= (and d!99441 c!80238) b!731191))

(assert (= (and d!99441 (not c!80238)) b!731184))

(assert (= (and b!731184 c!80236) b!731188))

(assert (= (and b!731184 (not c!80236)) b!731187))

(assert (= (and d!99441 c!80237) b!731190))

(assert (= (and d!99441 (not c!80237)) b!731192))

(assert (= (and b!731192 res!491462) b!731186))

(assert (= (and b!731186 (not res!491463)) b!731189))

(assert (= (and b!731189 (not res!491464)) b!731185))

(declare-fun m!684039 () Bool)

(assert (=> b!731189 m!684039))

(assert (=> b!731185 m!684039))

(declare-fun m!684041 () Bool)

(assert (=> d!99441 m!684041))

(assert (=> d!99441 m!683905))

(assert (=> b!731186 m!684039))

(assert (=> b!731187 m!683867))

(assert (=> b!731187 m!683867))

(declare-fun m!684043 () Bool)

(assert (=> b!731187 m!684043))

(assert (=> b!730964 d!99441))

(declare-fun b!731193 () Bool)

(declare-fun e!409130 () SeekEntryResult!7318)

(declare-fun e!409128 () SeekEntryResult!7318)

(assert (=> b!731193 (= e!409130 e!409128)))

(declare-fun c!80239 () Bool)

(declare-fun lt!323907 () (_ BitVec 64))

(assert (=> b!731193 (= c!80239 (or (= lt!323907 lt!323807) (= (bvadd lt!323907 lt!323907) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731194 () Bool)

(declare-fun lt!323906 () SeekEntryResult!7318)

(assert (=> b!731194 (and (bvsge (index!31642 lt!323906) #b00000000000000000000000000000000) (bvslt (index!31642 lt!323906) (size!20142 lt!323811)))))

(declare-fun e!409127 () Bool)

(assert (=> b!731194 (= e!409127 (= (select (arr!19721 lt!323811) (index!31642 lt!323906)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731195 () Bool)

(assert (=> b!731195 (and (bvsge (index!31642 lt!323906) #b00000000000000000000000000000000) (bvslt (index!31642 lt!323906) (size!20142 lt!323811)))))

(declare-fun res!491466 () Bool)

(assert (=> b!731195 (= res!491466 (= (select (arr!19721 lt!323811) (index!31642 lt!323906)) lt!323807))))

(assert (=> b!731195 (=> res!491466 e!409127)))

(declare-fun e!409129 () Bool)

(assert (=> b!731195 (= e!409129 e!409127)))

(declare-fun b!731196 () Bool)

(assert (=> b!731196 (= e!409128 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!323807 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!323807 lt!323811 mask!3328))))

(declare-fun b!731197 () Bool)

(assert (=> b!731197 (= e!409128 (Intermediate!7318 false (toIndex!0 lt!323807 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!731198 () Bool)

(assert (=> b!731198 (and (bvsge (index!31642 lt!323906) #b00000000000000000000000000000000) (bvslt (index!31642 lt!323906) (size!20142 lt!323811)))))

(declare-fun res!491467 () Bool)

(assert (=> b!731198 (= res!491467 (= (select (arr!19721 lt!323811) (index!31642 lt!323906)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731198 (=> res!491467 e!409127)))

(declare-fun b!731200 () Bool)

(assert (=> b!731200 (= e!409130 (Intermediate!7318 true (toIndex!0 lt!323807 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!731201 () Bool)

(declare-fun e!409126 () Bool)

(assert (=> b!731201 (= e!409126 e!409129)))

(declare-fun res!491465 () Bool)

(assert (=> b!731201 (= res!491465 (and ((_ is Intermediate!7318) lt!323906) (not (undefined!8130 lt!323906)) (bvslt (x!62623 lt!323906) #b01111111111111111111111111111110) (bvsge (x!62623 lt!323906) #b00000000000000000000000000000000) (bvsge (x!62623 lt!323906) #b00000000000000000000000000000000)))))

(assert (=> b!731201 (=> (not res!491465) (not e!409129))))

(declare-fun b!731199 () Bool)

(assert (=> b!731199 (= e!409126 (bvsge (x!62623 lt!323906) #b01111111111111111111111111111110))))

(declare-fun d!99443 () Bool)

(assert (=> d!99443 e!409126))

(declare-fun c!80240 () Bool)

(assert (=> d!99443 (= c!80240 (and ((_ is Intermediate!7318) lt!323906) (undefined!8130 lt!323906)))))

(assert (=> d!99443 (= lt!323906 e!409130)))

(declare-fun c!80241 () Bool)

(assert (=> d!99443 (= c!80241 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99443 (= lt!323907 (select (arr!19721 lt!323811) (toIndex!0 lt!323807 mask!3328)))))

(assert (=> d!99443 (validMask!0 mask!3328)))

(assert (=> d!99443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323807 mask!3328) lt!323807 lt!323811 mask!3328) lt!323906)))

(assert (= (and d!99443 c!80241) b!731200))

(assert (= (and d!99443 (not c!80241)) b!731193))

(assert (= (and b!731193 c!80239) b!731197))

(assert (= (and b!731193 (not c!80239)) b!731196))

(assert (= (and d!99443 c!80240) b!731199))

(assert (= (and d!99443 (not c!80240)) b!731201))

(assert (= (and b!731201 res!491465) b!731195))

(assert (= (and b!731195 (not res!491466)) b!731198))

(assert (= (and b!731198 (not res!491467)) b!731194))

(declare-fun m!684045 () Bool)

(assert (=> b!731198 m!684045))

(assert (=> b!731194 m!684045))

(assert (=> d!99443 m!683883))

(declare-fun m!684047 () Bool)

(assert (=> d!99443 m!684047))

(assert (=> d!99443 m!683905))

(assert (=> b!731195 m!684045))

(assert (=> b!731196 m!683883))

(declare-fun m!684049 () Bool)

(assert (=> b!731196 m!684049))

(assert (=> b!731196 m!684049))

(declare-fun m!684051 () Bool)

(assert (=> b!731196 m!684051))

(assert (=> b!730964 d!99443))

(declare-fun d!99445 () Bool)

(declare-fun lt!323925 () (_ BitVec 32))

(declare-fun lt!323924 () (_ BitVec 32))

(assert (=> d!99445 (= lt!323925 (bvmul (bvxor lt!323924 (bvlshr lt!323924 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99445 (= lt!323924 ((_ extract 31 0) (bvand (bvxor lt!323807 (bvlshr lt!323807 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99445 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491468 (let ((h!14822 ((_ extract 31 0) (bvand (bvxor lt!323807 (bvlshr lt!323807 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62631 (bvmul (bvxor h!14822 (bvlshr h!14822 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62631 (bvlshr x!62631 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491468 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491468 #b00000000000000000000000000000000))))))

(assert (=> d!99445 (= (toIndex!0 lt!323807 mask!3328) (bvand (bvxor lt!323925 (bvlshr lt!323925 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!730964 d!99445))

(declare-fun b!731226 () Bool)

(declare-fun e!409143 () Bool)

(declare-fun call!34805 () Bool)

(assert (=> b!731226 (= e!409143 call!34805)))

(declare-fun bm!34802 () Bool)

(assert (=> bm!34802 (= call!34805 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!731227 () Bool)

(declare-fun e!409144 () Bool)

(assert (=> b!731227 (= e!409144 e!409143)))

(declare-fun c!80254 () Bool)

(assert (=> b!731227 (= c!80254 (validKeyInArray!0 (select (arr!19721 a!3186) j!159)))))

(declare-fun d!99447 () Bool)

(declare-fun res!491470 () Bool)

(assert (=> d!99447 (=> res!491470 e!409144)))

(assert (=> d!99447 (= res!491470 (bvsge j!159 (size!20142 a!3186)))))

(assert (=> d!99447 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!409144)))

(declare-fun b!731228 () Bool)

(declare-fun e!409145 () Bool)

(assert (=> b!731228 (= e!409143 e!409145)))

(declare-fun lt!323926 () (_ BitVec 64))

(assert (=> b!731228 (= lt!323926 (select (arr!19721 a!3186) j!159))))

(declare-fun lt!323927 () Unit!24926)

(assert (=> b!731228 (= lt!323927 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!323926 j!159))))

(assert (=> b!731228 (arrayContainsKey!0 a!3186 lt!323926 #b00000000000000000000000000000000)))

(declare-fun lt!323928 () Unit!24926)

(assert (=> b!731228 (= lt!323928 lt!323927)))

(declare-fun res!491469 () Bool)

(assert (=> b!731228 (= res!491469 (= (seekEntryOrOpen!0 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) (Found!7318 j!159)))))

(assert (=> b!731228 (=> (not res!491469) (not e!409145))))

(declare-fun b!731229 () Bool)

(assert (=> b!731229 (= e!409145 call!34805)))

(assert (= (and d!99447 (not res!491470)) b!731227))

(assert (= (and b!731227 c!80254) b!731228))

(assert (= (and b!731227 (not c!80254)) b!731226))

(assert (= (and b!731228 res!491469) b!731229))

(assert (= (or b!731229 b!731226) bm!34802))

(declare-fun m!684053 () Bool)

(assert (=> bm!34802 m!684053))

(assert (=> b!731227 m!683861))

(assert (=> b!731227 m!683861))

(assert (=> b!731227 m!683881))

(assert (=> b!731228 m!683861))

(declare-fun m!684055 () Bool)

(assert (=> b!731228 m!684055))

(declare-fun m!684057 () Bool)

(assert (=> b!731228 m!684057))

(assert (=> b!731228 m!683861))

(assert (=> b!731228 m!683869))

(assert (=> b!730974 d!99447))

(declare-fun d!99449 () Bool)

(assert (=> d!99449 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!323940 () Unit!24926)

(declare-fun choose!38 (array!41202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24926)

(assert (=> d!99449 (= lt!323940 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99449 (validMask!0 mask!3328)))

(assert (=> d!99449 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!323940)))

(declare-fun bs!20905 () Bool)

(assert (= bs!20905 d!99449))

(assert (=> bs!20905 m!683875))

(declare-fun m!684093 () Bool)

(assert (=> bs!20905 m!684093))

(assert (=> bs!20905 m!683905))

(assert (=> b!730974 d!99449))

(declare-fun bm!34808 () Bool)

(declare-fun call!34811 () Bool)

(declare-fun c!80281 () Bool)

(assert (=> bm!34808 (= call!34811 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80281 (Cons!13758 (select (arr!19721 a!3186) #b00000000000000000000000000000000) Nil!13759) Nil!13759)))))

(declare-fun b!731297 () Bool)

(declare-fun e!409187 () Bool)

(declare-fun e!409190 () Bool)

(assert (=> b!731297 (= e!409187 e!409190)))

(declare-fun res!491486 () Bool)

(assert (=> b!731297 (=> (not res!491486) (not e!409190))))

(declare-fun e!409189 () Bool)

(assert (=> b!731297 (= res!491486 (not e!409189))))

(declare-fun res!491488 () Bool)

(assert (=> b!731297 (=> (not res!491488) (not e!409189))))

(assert (=> b!731297 (= res!491488 (validKeyInArray!0 (select (arr!19721 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99457 () Bool)

(declare-fun res!491487 () Bool)

(assert (=> d!99457 (=> res!491487 e!409187)))

(assert (=> d!99457 (= res!491487 (bvsge #b00000000000000000000000000000000 (size!20142 a!3186)))))

(assert (=> d!99457 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13759) e!409187)))

(declare-fun b!731298 () Bool)

(declare-fun e!409188 () Bool)

(assert (=> b!731298 (= e!409188 call!34811)))

(declare-fun b!731299 () Bool)

(declare-fun contains!4034 (List!13762 (_ BitVec 64)) Bool)

(assert (=> b!731299 (= e!409189 (contains!4034 Nil!13759 (select (arr!19721 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!731300 () Bool)

(assert (=> b!731300 (= e!409190 e!409188)))

(assert (=> b!731300 (= c!80281 (validKeyInArray!0 (select (arr!19721 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!731301 () Bool)

(assert (=> b!731301 (= e!409188 call!34811)))

(assert (= (and d!99457 (not res!491487)) b!731297))

(assert (= (and b!731297 res!491488) b!731299))

(assert (= (and b!731297 res!491486) b!731300))

(assert (= (and b!731300 c!80281) b!731301))

(assert (= (and b!731300 (not c!80281)) b!731298))

(assert (= (or b!731301 b!731298) bm!34808))

(assert (=> bm!34808 m!684019))

(declare-fun m!684123 () Bool)

(assert (=> bm!34808 m!684123))

(assert (=> b!731297 m!684019))

(assert (=> b!731297 m!684019))

(assert (=> b!731297 m!684021))

(assert (=> b!731299 m!684019))

(assert (=> b!731299 m!684019))

(declare-fun m!684127 () Bool)

(assert (=> b!731299 m!684127))

(assert (=> b!731300 m!684019))

(assert (=> b!731300 m!684019))

(assert (=> b!731300 m!684021))

(assert (=> b!730963 d!99457))

(declare-fun d!99465 () Bool)

(assert (=> d!99465 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!730972 d!99465))

(declare-fun d!99467 () Bool)

(declare-fun res!491497 () Bool)

(declare-fun e!409199 () Bool)

(assert (=> d!99467 (=> res!491497 e!409199)))

(assert (=> d!99467 (= res!491497 (= (select (arr!19721 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99467 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!409199)))

(declare-fun b!731310 () Bool)

(declare-fun e!409200 () Bool)

(assert (=> b!731310 (= e!409199 e!409200)))

(declare-fun res!491498 () Bool)

(assert (=> b!731310 (=> (not res!491498) (not e!409200))))

(assert (=> b!731310 (= res!491498 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20142 a!3186)))))

(declare-fun b!731311 () Bool)

(assert (=> b!731311 (= e!409200 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99467 (not res!491497)) b!731310))

(assert (= (and b!731310 res!491498) b!731311))

(assert (=> d!99467 m!684019))

(declare-fun m!684135 () Bool)

(assert (=> b!731311 m!684135))

(assert (=> b!730961 d!99467))

(assert (=> b!730968 d!99421))

(declare-fun b!731314 () Bool)

(declare-fun e!409204 () SeekEntryResult!7318)

(assert (=> b!731314 (= e!409204 Undefined!7318)))

(declare-fun b!731315 () Bool)

(declare-fun e!409203 () SeekEntryResult!7318)

(assert (=> b!731315 (= e!409203 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19721 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731316 () Bool)

(declare-fun c!80282 () Bool)

(declare-fun lt!323954 () (_ BitVec 64))

(assert (=> b!731316 (= c!80282 (= lt!323954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409205 () SeekEntryResult!7318)

(assert (=> b!731316 (= e!409205 e!409203)))

(declare-fun b!731317 () Bool)

(assert (=> b!731317 (= e!409203 (MissingVacant!7318 resIntermediateIndex!5))))

(declare-fun b!731318 () Bool)

(assert (=> b!731318 (= e!409204 e!409205)))

(declare-fun c!80284 () Bool)

(assert (=> b!731318 (= c!80284 (= lt!323954 (select (arr!19721 a!3186) j!159)))))

(declare-fun b!731319 () Bool)

(assert (=> b!731319 (= e!409205 (Found!7318 resIntermediateIndex!5))))

(declare-fun lt!323953 () SeekEntryResult!7318)

(declare-fun d!99473 () Bool)

(assert (=> d!99473 (and (or ((_ is Undefined!7318) lt!323953) (not ((_ is Found!7318) lt!323953)) (and (bvsge (index!31641 lt!323953) #b00000000000000000000000000000000) (bvslt (index!31641 lt!323953) (size!20142 a!3186)))) (or ((_ is Undefined!7318) lt!323953) ((_ is Found!7318) lt!323953) (not ((_ is MissingVacant!7318) lt!323953)) (not (= (index!31643 lt!323953) resIntermediateIndex!5)) (and (bvsge (index!31643 lt!323953) #b00000000000000000000000000000000) (bvslt (index!31643 lt!323953) (size!20142 a!3186)))) (or ((_ is Undefined!7318) lt!323953) (ite ((_ is Found!7318) lt!323953) (= (select (arr!19721 a!3186) (index!31641 lt!323953)) (select (arr!19721 a!3186) j!159)) (and ((_ is MissingVacant!7318) lt!323953) (= (index!31643 lt!323953) resIntermediateIndex!5) (= (select (arr!19721 a!3186) (index!31643 lt!323953)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99473 (= lt!323953 e!409204)))

(declare-fun c!80283 () Bool)

(assert (=> d!99473 (= c!80283 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99473 (= lt!323954 (select (arr!19721 a!3186) resIntermediateIndex!5))))

(assert (=> d!99473 (validMask!0 mask!3328)))

(assert (=> d!99473 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!323953)))

(assert (= (and d!99473 c!80283) b!731314))

(assert (= (and d!99473 (not c!80283)) b!731318))

(assert (= (and b!731318 c!80284) b!731319))

(assert (= (and b!731318 (not c!80284)) b!731316))

(assert (= (and b!731316 c!80282) b!731317))

(assert (= (and b!731316 (not c!80282)) b!731315))

(declare-fun m!684137 () Bool)

(assert (=> b!731315 m!684137))

(assert (=> b!731315 m!684137))

(assert (=> b!731315 m!683861))

(declare-fun m!684139 () Bool)

(assert (=> b!731315 m!684139))

(declare-fun m!684141 () Bool)

(assert (=> d!99473 m!684141))

(declare-fun m!684143 () Bool)

(assert (=> d!99473 m!684143))

(assert (=> d!99473 m!683893))

(assert (=> d!99473 m!683905))

(assert (=> b!730978 d!99473))

(declare-fun d!99475 () Bool)

(declare-fun lt!323994 () SeekEntryResult!7318)

(assert (=> d!99475 (and (or ((_ is Undefined!7318) lt!323994) (not ((_ is Found!7318) lt!323994)) (and (bvsge (index!31641 lt!323994) #b00000000000000000000000000000000) (bvslt (index!31641 lt!323994) (size!20142 a!3186)))) (or ((_ is Undefined!7318) lt!323994) ((_ is Found!7318) lt!323994) (not ((_ is MissingZero!7318) lt!323994)) (and (bvsge (index!31640 lt!323994) #b00000000000000000000000000000000) (bvslt (index!31640 lt!323994) (size!20142 a!3186)))) (or ((_ is Undefined!7318) lt!323994) ((_ is Found!7318) lt!323994) ((_ is MissingZero!7318) lt!323994) (not ((_ is MissingVacant!7318) lt!323994)) (and (bvsge (index!31643 lt!323994) #b00000000000000000000000000000000) (bvslt (index!31643 lt!323994) (size!20142 a!3186)))) (or ((_ is Undefined!7318) lt!323994) (ite ((_ is Found!7318) lt!323994) (= (select (arr!19721 a!3186) (index!31641 lt!323994)) k0!2102) (ite ((_ is MissingZero!7318) lt!323994) (= (select (arr!19721 a!3186) (index!31640 lt!323994)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7318) lt!323994) (= (select (arr!19721 a!3186) (index!31643 lt!323994)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!409262 () SeekEntryResult!7318)

(assert (=> d!99475 (= lt!323994 e!409262)))

(declare-fun c!80321 () Bool)

(declare-fun lt!323996 () SeekEntryResult!7318)

(assert (=> d!99475 (= c!80321 (and ((_ is Intermediate!7318) lt!323996) (undefined!8130 lt!323996)))))

(assert (=> d!99475 (= lt!323996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99475 (validMask!0 mask!3328)))

(assert (=> d!99475 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!323994)))

(declare-fun b!731415 () Bool)

(declare-fun e!409263 () SeekEntryResult!7318)

(assert (=> b!731415 (= e!409262 e!409263)))

(declare-fun lt!323995 () (_ BitVec 64))

(assert (=> b!731415 (= lt!323995 (select (arr!19721 a!3186) (index!31642 lt!323996)))))

(declare-fun c!80322 () Bool)

(assert (=> b!731415 (= c!80322 (= lt!323995 k0!2102))))

(declare-fun b!731416 () Bool)

(declare-fun e!409264 () SeekEntryResult!7318)

(assert (=> b!731416 (= e!409264 (MissingZero!7318 (index!31642 lt!323996)))))

(declare-fun b!731417 () Bool)

(assert (=> b!731417 (= e!409264 (seekKeyOrZeroReturnVacant!0 (x!62623 lt!323996) (index!31642 lt!323996) (index!31642 lt!323996) k0!2102 a!3186 mask!3328))))

(declare-fun b!731418 () Bool)

(declare-fun c!80323 () Bool)

(assert (=> b!731418 (= c!80323 (= lt!323995 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731418 (= e!409263 e!409264)))

(declare-fun b!731419 () Bool)

(assert (=> b!731419 (= e!409263 (Found!7318 (index!31642 lt!323996)))))

(declare-fun b!731420 () Bool)

(assert (=> b!731420 (= e!409262 Undefined!7318)))

(assert (= (and d!99475 c!80321) b!731420))

(assert (= (and d!99475 (not c!80321)) b!731415))

(assert (= (and b!731415 c!80322) b!731419))

(assert (= (and b!731415 (not c!80322)) b!731418))

(assert (= (and b!731418 c!80323) b!731416))

(assert (= (and b!731418 (not c!80323)) b!731417))

(declare-fun m!684205 () Bool)

(assert (=> d!99475 m!684205))

(assert (=> d!99475 m!683905))

(declare-fun m!684207 () Bool)

(assert (=> d!99475 m!684207))

(declare-fun m!684209 () Bool)

(assert (=> d!99475 m!684209))

(declare-fun m!684211 () Bool)

(assert (=> d!99475 m!684211))

(assert (=> d!99475 m!684207))

(declare-fun m!684213 () Bool)

(assert (=> d!99475 m!684213))

(declare-fun m!684215 () Bool)

(assert (=> b!731415 m!684215))

(declare-fun m!684217 () Bool)

(assert (=> b!731417 m!684217))

(assert (=> b!730967 d!99475))

(declare-fun d!99503 () Bool)

(declare-fun lt!323997 () SeekEntryResult!7318)

(assert (=> d!99503 (and (or ((_ is Undefined!7318) lt!323997) (not ((_ is Found!7318) lt!323997)) (and (bvsge (index!31641 lt!323997) #b00000000000000000000000000000000) (bvslt (index!31641 lt!323997) (size!20142 a!3186)))) (or ((_ is Undefined!7318) lt!323997) ((_ is Found!7318) lt!323997) (not ((_ is MissingZero!7318) lt!323997)) (and (bvsge (index!31640 lt!323997) #b00000000000000000000000000000000) (bvslt (index!31640 lt!323997) (size!20142 a!3186)))) (or ((_ is Undefined!7318) lt!323997) ((_ is Found!7318) lt!323997) ((_ is MissingZero!7318) lt!323997) (not ((_ is MissingVacant!7318) lt!323997)) (and (bvsge (index!31643 lt!323997) #b00000000000000000000000000000000) (bvslt (index!31643 lt!323997) (size!20142 a!3186)))) (or ((_ is Undefined!7318) lt!323997) (ite ((_ is Found!7318) lt!323997) (= (select (arr!19721 a!3186) (index!31641 lt!323997)) (select (arr!19721 a!3186) j!159)) (ite ((_ is MissingZero!7318) lt!323997) (= (select (arr!19721 a!3186) (index!31640 lt!323997)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7318) lt!323997) (= (select (arr!19721 a!3186) (index!31643 lt!323997)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!409265 () SeekEntryResult!7318)

(assert (=> d!99503 (= lt!323997 e!409265)))

(declare-fun c!80324 () Bool)

(declare-fun lt!323999 () SeekEntryResult!7318)

(assert (=> d!99503 (= c!80324 (and ((_ is Intermediate!7318) lt!323999) (undefined!8130 lt!323999)))))

(assert (=> d!99503 (= lt!323999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19721 a!3186) j!159) mask!3328) (select (arr!19721 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99503 (validMask!0 mask!3328)))

(assert (=> d!99503 (= (seekEntryOrOpen!0 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!323997)))

(declare-fun b!731421 () Bool)

(declare-fun e!409266 () SeekEntryResult!7318)

(assert (=> b!731421 (= e!409265 e!409266)))

(declare-fun lt!323998 () (_ BitVec 64))

(assert (=> b!731421 (= lt!323998 (select (arr!19721 a!3186) (index!31642 lt!323999)))))

(declare-fun c!80325 () Bool)

(assert (=> b!731421 (= c!80325 (= lt!323998 (select (arr!19721 a!3186) j!159)))))

(declare-fun b!731422 () Bool)

(declare-fun e!409267 () SeekEntryResult!7318)

(assert (=> b!731422 (= e!409267 (MissingZero!7318 (index!31642 lt!323999)))))

(declare-fun b!731423 () Bool)

(assert (=> b!731423 (= e!409267 (seekKeyOrZeroReturnVacant!0 (x!62623 lt!323999) (index!31642 lt!323999) (index!31642 lt!323999) (select (arr!19721 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731424 () Bool)

(declare-fun c!80326 () Bool)

(assert (=> b!731424 (= c!80326 (= lt!323998 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731424 (= e!409266 e!409267)))

(declare-fun b!731425 () Bool)

(assert (=> b!731425 (= e!409266 (Found!7318 (index!31642 lt!323999)))))

(declare-fun b!731426 () Bool)

(assert (=> b!731426 (= e!409265 Undefined!7318)))

(assert (= (and d!99503 c!80324) b!731426))

(assert (= (and d!99503 (not c!80324)) b!731421))

(assert (= (and b!731421 c!80325) b!731425))

(assert (= (and b!731421 (not c!80325)) b!731424))

(assert (= (and b!731424 c!80326) b!731422))

(assert (= (and b!731424 (not c!80326)) b!731423))

(declare-fun m!684219 () Bool)

(assert (=> d!99503 m!684219))

(assert (=> d!99503 m!683905))

(assert (=> d!99503 m!683861))

(assert (=> d!99503 m!683863))

(declare-fun m!684221 () Bool)

(assert (=> d!99503 m!684221))

(declare-fun m!684223 () Bool)

(assert (=> d!99503 m!684223))

(assert (=> d!99503 m!683863))

(assert (=> d!99503 m!683861))

(assert (=> d!99503 m!683865))

(declare-fun m!684229 () Bool)

(assert (=> b!731421 m!684229))

(assert (=> b!731423 m!683861))

(declare-fun m!684231 () Bool)

(assert (=> b!731423 m!684231))

(assert (=> b!730969 d!99503))

(declare-fun b!731432 () Bool)

(declare-fun e!409276 () SeekEntryResult!7318)

(declare-fun e!409274 () SeekEntryResult!7318)

(assert (=> b!731432 (= e!409276 e!409274)))

(declare-fun c!80328 () Bool)

(declare-fun lt!324001 () (_ BitVec 64))

(assert (=> b!731432 (= c!80328 (or (= lt!324001 (select (arr!19721 a!3186) j!159)) (= (bvadd lt!324001 lt!324001) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731433 () Bool)

(declare-fun lt!324000 () SeekEntryResult!7318)

(assert (=> b!731433 (and (bvsge (index!31642 lt!324000) #b00000000000000000000000000000000) (bvslt (index!31642 lt!324000) (size!20142 a!3186)))))

(declare-fun e!409273 () Bool)

(assert (=> b!731433 (= e!409273 (= (select (arr!19721 a!3186) (index!31642 lt!324000)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731434 () Bool)

(assert (=> b!731434 (and (bvsge (index!31642 lt!324000) #b00000000000000000000000000000000) (bvslt (index!31642 lt!324000) (size!20142 a!3186)))))

(declare-fun res!491528 () Bool)

(assert (=> b!731434 (= res!491528 (= (select (arr!19721 a!3186) (index!31642 lt!324000)) (select (arr!19721 a!3186) j!159)))))

(assert (=> b!731434 (=> res!491528 e!409273)))

(declare-fun e!409275 () Bool)

(assert (=> b!731434 (= e!409275 e!409273)))

(declare-fun b!731435 () Bool)

(assert (=> b!731435 (= e!409274 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19721 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19721 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731436 () Bool)

(assert (=> b!731436 (= e!409274 (Intermediate!7318 false (toIndex!0 (select (arr!19721 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!731437 () Bool)

(assert (=> b!731437 (and (bvsge (index!31642 lt!324000) #b00000000000000000000000000000000) (bvslt (index!31642 lt!324000) (size!20142 a!3186)))))

(declare-fun res!491529 () Bool)

(assert (=> b!731437 (= res!491529 (= (select (arr!19721 a!3186) (index!31642 lt!324000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731437 (=> res!491529 e!409273)))

(declare-fun b!731439 () Bool)

(assert (=> b!731439 (= e!409276 (Intermediate!7318 true (toIndex!0 (select (arr!19721 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!731440 () Bool)

(declare-fun e!409272 () Bool)

(assert (=> b!731440 (= e!409272 e!409275)))

(declare-fun res!491527 () Bool)

(assert (=> b!731440 (= res!491527 (and ((_ is Intermediate!7318) lt!324000) (not (undefined!8130 lt!324000)) (bvslt (x!62623 lt!324000) #b01111111111111111111111111111110) (bvsge (x!62623 lt!324000) #b00000000000000000000000000000000) (bvsge (x!62623 lt!324000) #b00000000000000000000000000000000)))))

(assert (=> b!731440 (=> (not res!491527) (not e!409275))))

(declare-fun b!731438 () Bool)

(assert (=> b!731438 (= e!409272 (bvsge (x!62623 lt!324000) #b01111111111111111111111111111110))))

(declare-fun d!99505 () Bool)

(assert (=> d!99505 e!409272))

(declare-fun c!80329 () Bool)

(assert (=> d!99505 (= c!80329 (and ((_ is Intermediate!7318) lt!324000) (undefined!8130 lt!324000)))))

(assert (=> d!99505 (= lt!324000 e!409276)))

(declare-fun c!80330 () Bool)

(assert (=> d!99505 (= c!80330 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99505 (= lt!324001 (select (arr!19721 a!3186) (toIndex!0 (select (arr!19721 a!3186) j!159) mask!3328)))))

(assert (=> d!99505 (validMask!0 mask!3328)))

(assert (=> d!99505 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19721 a!3186) j!159) mask!3328) (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!324000)))

(assert (= (and d!99505 c!80330) b!731439))

(assert (= (and d!99505 (not c!80330)) b!731432))

(assert (= (and b!731432 c!80328) b!731436))

(assert (= (and b!731432 (not c!80328)) b!731435))

(assert (= (and d!99505 c!80329) b!731438))

(assert (= (and d!99505 (not c!80329)) b!731440))

(assert (= (and b!731440 res!491527) b!731434))

(assert (= (and b!731434 (not res!491528)) b!731437))

(assert (= (and b!731437 (not res!491529)) b!731433))

(declare-fun m!684233 () Bool)

(assert (=> b!731437 m!684233))

(assert (=> b!731433 m!684233))

(assert (=> d!99505 m!683863))

(declare-fun m!684235 () Bool)

(assert (=> d!99505 m!684235))

(assert (=> d!99505 m!683905))

(assert (=> b!731434 m!684233))

(assert (=> b!731435 m!683863))

(declare-fun m!684237 () Bool)

(assert (=> b!731435 m!684237))

(assert (=> b!731435 m!684237))

(assert (=> b!731435 m!683861))

(declare-fun m!684239 () Bool)

(assert (=> b!731435 m!684239))

(assert (=> b!730979 d!99505))

(declare-fun d!99507 () Bool)

(declare-fun lt!324003 () (_ BitVec 32))

(declare-fun lt!324002 () (_ BitVec 32))

(assert (=> d!99507 (= lt!324003 (bvmul (bvxor lt!324002 (bvlshr lt!324002 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99507 (= lt!324002 ((_ extract 31 0) (bvand (bvxor (select (arr!19721 a!3186) j!159) (bvlshr (select (arr!19721 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99507 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491468 (let ((h!14822 ((_ extract 31 0) (bvand (bvxor (select (arr!19721 a!3186) j!159) (bvlshr (select (arr!19721 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62631 (bvmul (bvxor h!14822 (bvlshr h!14822 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62631 (bvlshr x!62631 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491468 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491468 #b00000000000000000000000000000000))))))

(assert (=> d!99507 (= (toIndex!0 (select (arr!19721 a!3186) j!159) mask!3328) (bvand (bvxor lt!324003 (bvlshr lt!324003 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!730979 d!99507))

(check-sat (not b!731297) (not b!731300) (not b!731299) (not b!731155) (not d!99475) (not b!731315) (not b!731187) (not d!99503) (not d!99443) (not b!731227) (not b!731140) (not b!731417) (not b!731435) (not b!731228) (not d!99473) (not d!99505) (not b!731423) (not b!731311) (not d!99429) (not bm!34808) (not b!731196) (not d!99417) (not b!731121) (not d!99449) (not d!99421) (not d!99441) (not bm!34801) (not b!731154) (not bm!34802))
(check-sat)
