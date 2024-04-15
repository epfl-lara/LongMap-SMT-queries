; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118760 () Bool)

(assert start!118760)

(declare-fun b!1387821 () Bool)

(declare-fun res!928504 () Bool)

(declare-fun e!786150 () Bool)

(assert (=> b!1387821 (=> (not res!928504) (not e!786150))))

(declare-datatypes ((array!94884 0))(
  ( (array!94885 (arr!45817 (Array (_ BitVec 32) (_ BitVec 64))) (size!46369 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94884)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1387821 (= res!928504 (and (not (= (select (arr!45817 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45817 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!928502 () Bool)

(assert (=> start!118760 (=> (not res!928502) (not e!786150))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118760 (= res!928502 (validMask!0 mask!2987))))

(assert (=> start!118760 e!786150))

(assert (=> start!118760 true))

(declare-fun array_inv!35050 (array!94884) Bool)

(assert (=> start!118760 (array_inv!35050 a!2938)))

(declare-fun b!1387822 () Bool)

(declare-fun e!786147 () Bool)

(assert (=> b!1387822 (= e!786150 e!786147)))

(declare-fun res!928505 () Bool)

(assert (=> b!1387822 (=> (not res!928505) (not e!786147))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1387822 (= res!928505 (bvsge startIndex!16 (bvsub (size!46369 a!2938) #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!46242 0))(
  ( (Unit!46243) )
))
(declare-fun lt!609897 () Unit!46242)

(declare-fun e!786151 () Unit!46242)

(assert (=> b!1387822 (= lt!609897 e!786151)))

(declare-fun c!129104 () Bool)

(declare-fun e!786149 () Bool)

(assert (=> b!1387822 (= c!129104 e!786149)))

(declare-fun res!928503 () Bool)

(assert (=> b!1387822 (=> (not res!928503) (not e!786149))))

(assert (=> b!1387822 (= res!928503 (not (= startIndex!16 i!1065)))))

(declare-fun lt!609898 () array!94884)

(assert (=> b!1387822 (= lt!609898 (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938)))))

(declare-fun b!1387823 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387823 (= e!786149 (validKeyInArray!0 (select (arr!45817 a!2938) startIndex!16)))))

(declare-fun b!1387824 () Bool)

(declare-fun res!928507 () Bool)

(assert (=> b!1387824 (=> (not res!928507) (not e!786150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94884 (_ BitVec 32)) Bool)

(assert (=> b!1387824 (= res!928507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387825 () Bool)

(assert (=> b!1387825 (= e!786147 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!609898 mask!2987)))))

(declare-fun b!1387826 () Bool)

(declare-fun Unit!46244 () Unit!46242)

(assert (=> b!1387826 (= e!786151 Unit!46244)))

(declare-fun b!1387827 () Bool)

(declare-fun res!928508 () Bool)

(assert (=> b!1387827 (=> (not res!928508) (not e!786150))))

(declare-datatypes ((List!32423 0))(
  ( (Nil!32420) (Cons!32419 (h!33631 (_ BitVec 64)) (t!47109 List!32423)) )
))
(declare-fun arrayNoDuplicates!0 (array!94884 (_ BitVec 32) List!32423) Bool)

(assert (=> b!1387827 (= res!928508 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32420))))

(declare-fun b!1387828 () Bool)

(declare-fun lt!609896 () Unit!46242)

(assert (=> b!1387828 (= e!786151 lt!609896)))

(declare-fun lt!609899 () Unit!46242)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46242)

(assert (=> b!1387828 (= lt!609899 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10186 0))(
  ( (MissingZero!10186 (index!43115 (_ BitVec 32))) (Found!10186 (index!43116 (_ BitVec 32))) (Intermediate!10186 (undefined!10998 Bool) (index!43117 (_ BitVec 32)) (x!124729 (_ BitVec 32))) (Undefined!10186) (MissingVacant!10186 (index!43118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94884 (_ BitVec 32)) SeekEntryResult!10186)

(assert (=> b!1387828 (= (seekEntryOrOpen!0 (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609898 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46242)

(assert (=> b!1387828 (= lt!609896 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387828 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387829 () Bool)

(declare-fun res!928506 () Bool)

(assert (=> b!1387829 (=> (not res!928506) (not e!786150))))

(assert (=> b!1387829 (= res!928506 (validKeyInArray!0 (select (arr!45817 a!2938) i!1065)))))

(declare-fun b!1387830 () Bool)

(declare-fun res!928501 () Bool)

(assert (=> b!1387830 (=> (not res!928501) (not e!786150))))

(assert (=> b!1387830 (= res!928501 (and (= (size!46369 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46369 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46369 a!2938))))))

(assert (= (and start!118760 res!928502) b!1387830))

(assert (= (and b!1387830 res!928501) b!1387829))

(assert (= (and b!1387829 res!928506) b!1387827))

(assert (= (and b!1387827 res!928508) b!1387824))

(assert (= (and b!1387824 res!928507) b!1387821))

(assert (= (and b!1387821 res!928504) b!1387822))

(assert (= (and b!1387822 res!928503) b!1387823))

(assert (= (and b!1387822 c!129104) b!1387828))

(assert (= (and b!1387822 (not c!129104)) b!1387826))

(assert (= (and b!1387822 res!928505) b!1387825))

(declare-fun m!1273041 () Bool)

(assert (=> start!118760 m!1273041))

(declare-fun m!1273043 () Bool)

(assert (=> start!118760 m!1273043))

(declare-fun m!1273045 () Bool)

(assert (=> b!1387824 m!1273045))

(declare-fun m!1273047 () Bool)

(assert (=> b!1387827 m!1273047))

(declare-fun m!1273049 () Bool)

(assert (=> b!1387823 m!1273049))

(assert (=> b!1387823 m!1273049))

(declare-fun m!1273051 () Bool)

(assert (=> b!1387823 m!1273051))

(declare-fun m!1273053 () Bool)

(assert (=> b!1387825 m!1273053))

(declare-fun m!1273055 () Bool)

(assert (=> b!1387828 m!1273055))

(declare-fun m!1273057 () Bool)

(assert (=> b!1387828 m!1273057))

(assert (=> b!1387828 m!1273057))

(declare-fun m!1273059 () Bool)

(assert (=> b!1387828 m!1273059))

(declare-fun m!1273061 () Bool)

(assert (=> b!1387828 m!1273061))

(declare-fun m!1273063 () Bool)

(assert (=> b!1387828 m!1273063))

(assert (=> b!1387828 m!1273049))

(declare-fun m!1273065 () Bool)

(assert (=> b!1387828 m!1273065))

(assert (=> b!1387828 m!1273049))

(declare-fun m!1273067 () Bool)

(assert (=> b!1387828 m!1273067))

(assert (=> b!1387822 m!1273061))

(declare-fun m!1273069 () Bool)

(assert (=> b!1387821 m!1273069))

(assert (=> b!1387829 m!1273069))

(assert (=> b!1387829 m!1273069))

(declare-fun m!1273071 () Bool)

(assert (=> b!1387829 m!1273071))

(check-sat (not b!1387824) (not b!1387825) (not b!1387828) (not b!1387827) (not b!1387829) (not b!1387823) (not start!118760))
(check-sat)
(get-model)

(declare-fun b!1387903 () Bool)

(declare-fun e!786190 () SeekEntryResult!10186)

(declare-fun lt!609930 () SeekEntryResult!10186)

(assert (=> b!1387903 (= e!786190 (MissingZero!10186 (index!43117 lt!609930)))))

(declare-fun b!1387904 () Bool)

(declare-fun e!786189 () SeekEntryResult!10186)

(declare-fun e!786188 () SeekEntryResult!10186)

(assert (=> b!1387904 (= e!786189 e!786188)))

(declare-fun lt!609931 () (_ BitVec 64))

(assert (=> b!1387904 (= lt!609931 (select (arr!45817 lt!609898) (index!43117 lt!609930)))))

(declare-fun c!129119 () Bool)

(assert (=> b!1387904 (= c!129119 (= lt!609931 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387905 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94884 (_ BitVec 32)) SeekEntryResult!10186)

(assert (=> b!1387905 (= e!786190 (seekKeyOrZeroReturnVacant!0 (x!124729 lt!609930) (index!43117 lt!609930) (index!43117 lt!609930) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609898 mask!2987))))

(declare-fun b!1387906 () Bool)

(assert (=> b!1387906 (= e!786189 Undefined!10186)))

(declare-fun b!1387907 () Bool)

(assert (=> b!1387907 (= e!786188 (Found!10186 (index!43117 lt!609930)))))

(declare-fun lt!609932 () SeekEntryResult!10186)

(declare-fun d!149607 () Bool)

(get-info :version)

(assert (=> d!149607 (and (or ((_ is Undefined!10186) lt!609932) (not ((_ is Found!10186) lt!609932)) (and (bvsge (index!43116 lt!609932) #b00000000000000000000000000000000) (bvslt (index!43116 lt!609932) (size!46369 lt!609898)))) (or ((_ is Undefined!10186) lt!609932) ((_ is Found!10186) lt!609932) (not ((_ is MissingZero!10186) lt!609932)) (and (bvsge (index!43115 lt!609932) #b00000000000000000000000000000000) (bvslt (index!43115 lt!609932) (size!46369 lt!609898)))) (or ((_ is Undefined!10186) lt!609932) ((_ is Found!10186) lt!609932) ((_ is MissingZero!10186) lt!609932) (not ((_ is MissingVacant!10186) lt!609932)) (and (bvsge (index!43118 lt!609932) #b00000000000000000000000000000000) (bvslt (index!43118 lt!609932) (size!46369 lt!609898)))) (or ((_ is Undefined!10186) lt!609932) (ite ((_ is Found!10186) lt!609932) (= (select (arr!45817 lt!609898) (index!43116 lt!609932)) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10186) lt!609932) (= (select (arr!45817 lt!609898) (index!43115 lt!609932)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10186) lt!609932) (= (select (arr!45817 lt!609898) (index!43118 lt!609932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149607 (= lt!609932 e!786189)))

(declare-fun c!129117 () Bool)

(assert (=> d!149607 (= c!129117 (and ((_ is Intermediate!10186) lt!609930) (undefined!10998 lt!609930)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94884 (_ BitVec 32)) SeekEntryResult!10186)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!149607 (= lt!609930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609898 mask!2987))))

(assert (=> d!149607 (validMask!0 mask!2987)))

(assert (=> d!149607 (= (seekEntryOrOpen!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609898 mask!2987) lt!609932)))

(declare-fun b!1387908 () Bool)

(declare-fun c!129118 () Bool)

(assert (=> b!1387908 (= c!129118 (= lt!609931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387908 (= e!786188 e!786190)))

(assert (= (and d!149607 c!129117) b!1387906))

(assert (= (and d!149607 (not c!129117)) b!1387904))

(assert (= (and b!1387904 c!129119) b!1387907))

(assert (= (and b!1387904 (not c!129119)) b!1387908))

(assert (= (and b!1387908 c!129118) b!1387903))

(assert (= (and b!1387908 (not c!129118)) b!1387905))

(declare-fun m!1273137 () Bool)

(assert (=> b!1387904 m!1273137))

(assert (=> b!1387905 m!1273057))

(declare-fun m!1273139 () Bool)

(assert (=> b!1387905 m!1273139))

(assert (=> d!149607 m!1273057))

(declare-fun m!1273141 () Bool)

(assert (=> d!149607 m!1273141))

(declare-fun m!1273143 () Bool)

(assert (=> d!149607 m!1273143))

(declare-fun m!1273145 () Bool)

(assert (=> d!149607 m!1273145))

(assert (=> d!149607 m!1273041))

(declare-fun m!1273147 () Bool)

(assert (=> d!149607 m!1273147))

(assert (=> d!149607 m!1273141))

(assert (=> d!149607 m!1273057))

(declare-fun m!1273149 () Bool)

(assert (=> d!149607 m!1273149))

(assert (=> b!1387828 d!149607))

(declare-fun d!149609 () Bool)

(assert (=> d!149609 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun lt!609935 () Unit!46242)

(declare-fun choose!38 (array!94884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46242)

(assert (=> d!149609 (= lt!609935 (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> d!149609 (validMask!0 mask!2987)))

(assert (=> d!149609 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) lt!609935)))

(declare-fun bs!40312 () Bool)

(assert (= bs!40312 d!149609))

(assert (=> bs!40312 m!1273067))

(declare-fun m!1273151 () Bool)

(assert (=> bs!40312 m!1273151))

(assert (=> bs!40312 m!1273041))

(assert (=> b!1387828 d!149609))

(declare-fun b!1387932 () Bool)

(declare-fun e!786210 () Bool)

(declare-fun e!786211 () Bool)

(assert (=> b!1387932 (= e!786210 e!786211)))

(declare-fun lt!609944 () (_ BitVec 64))

(assert (=> b!1387932 (= lt!609944 (select (arr!45817 a!2938) startIndex!16))))

(declare-fun lt!609942 () Unit!46242)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94884 (_ BitVec 64) (_ BitVec 32)) Unit!46242)

(assert (=> b!1387932 (= lt!609942 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609944 startIndex!16))))

(declare-fun arrayContainsKey!0 (array!94884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1387932 (arrayContainsKey!0 a!2938 lt!609944 #b00000000000000000000000000000000)))

(declare-fun lt!609943 () Unit!46242)

(assert (=> b!1387932 (= lt!609943 lt!609942)))

(declare-fun res!928571 () Bool)

(assert (=> b!1387932 (= res!928571 (= (seekEntryOrOpen!0 (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987) (Found!10186 startIndex!16)))))

(assert (=> b!1387932 (=> (not res!928571) (not e!786211))))

(declare-fun b!1387933 () Bool)

(declare-fun e!786209 () Bool)

(assert (=> b!1387933 (= e!786209 e!786210)))

(declare-fun c!129125 () Bool)

(assert (=> b!1387933 (= c!129125 (validKeyInArray!0 (select (arr!45817 a!2938) startIndex!16)))))

(declare-fun bm!66582 () Bool)

(declare-fun call!66585 () Bool)

(assert (=> bm!66582 (= call!66585 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149613 () Bool)

(declare-fun res!928570 () Bool)

(assert (=> d!149613 (=> res!928570 e!786209)))

(assert (=> d!149613 (= res!928570 (bvsge startIndex!16 (size!46369 a!2938)))))

(assert (=> d!149613 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987) e!786209)))

(declare-fun b!1387934 () Bool)

(assert (=> b!1387934 (= e!786210 call!66585)))

(declare-fun b!1387935 () Bool)

(assert (=> b!1387935 (= e!786211 call!66585)))

(assert (= (and d!149613 (not res!928570)) b!1387933))

(assert (= (and b!1387933 c!129125) b!1387932))

(assert (= (and b!1387933 (not c!129125)) b!1387934))

(assert (= (and b!1387932 res!928571) b!1387935))

(assert (= (or b!1387935 b!1387934) bm!66582))

(assert (=> b!1387932 m!1273049))

(declare-fun m!1273161 () Bool)

(assert (=> b!1387932 m!1273161))

(declare-fun m!1273163 () Bool)

(assert (=> b!1387932 m!1273163))

(assert (=> b!1387932 m!1273049))

(assert (=> b!1387932 m!1273065))

(assert (=> b!1387933 m!1273049))

(assert (=> b!1387933 m!1273049))

(assert (=> b!1387933 m!1273051))

(declare-fun m!1273165 () Bool)

(assert (=> bm!66582 m!1273165))

(assert (=> b!1387828 d!149613))

(declare-fun d!149623 () Bool)

(declare-fun e!786232 () Bool)

(assert (=> d!149623 e!786232))

(declare-fun res!928586 () Bool)

(assert (=> d!149623 (=> (not res!928586) (not e!786232))))

(assert (=> d!149623 (= res!928586 (and (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46369 a!2938)) (and (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46369 a!2938)))) (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46369 a!2938)) (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46369 a!2938)))) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46369 a!2938))))))

(declare-fun lt!609968 () Unit!46242)

(declare-fun choose!14 (array!94884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46242)

(assert (=> d!149623 (= lt!609968 (choose!14 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (=> d!149623 (validMask!0 mask!2987)))

(assert (=> d!149623 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987) lt!609968)))

(declare-fun b!1387962 () Bool)

(assert (=> b!1387962 (= e!786232 (= (seekEntryOrOpen!0 (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938)) mask!2987)))))

(assert (= (and d!149623 res!928586) b!1387962))

(declare-fun m!1273187 () Bool)

(assert (=> d!149623 m!1273187))

(assert (=> d!149623 m!1273041))

(assert (=> b!1387962 m!1273061))

(assert (=> b!1387962 m!1273049))

(assert (=> b!1387962 m!1273049))

(assert (=> b!1387962 m!1273065))

(assert (=> b!1387962 m!1273057))

(declare-fun m!1273189 () Bool)

(assert (=> b!1387962 m!1273189))

(assert (=> b!1387962 m!1273057))

(assert (=> b!1387828 d!149623))

(declare-fun b!1387963 () Bool)

(declare-fun e!786235 () SeekEntryResult!10186)

(declare-fun lt!609969 () SeekEntryResult!10186)

(assert (=> b!1387963 (= e!786235 (MissingZero!10186 (index!43117 lt!609969)))))

(declare-fun b!1387964 () Bool)

(declare-fun e!786234 () SeekEntryResult!10186)

(declare-fun e!786233 () SeekEntryResult!10186)

(assert (=> b!1387964 (= e!786234 e!786233)))

(declare-fun lt!609970 () (_ BitVec 64))

(assert (=> b!1387964 (= lt!609970 (select (arr!45817 a!2938) (index!43117 lt!609969)))))

(declare-fun c!129134 () Bool)

(assert (=> b!1387964 (= c!129134 (= lt!609970 (select (arr!45817 a!2938) startIndex!16)))))

(declare-fun b!1387965 () Bool)

(assert (=> b!1387965 (= e!786235 (seekKeyOrZeroReturnVacant!0 (x!124729 lt!609969) (index!43117 lt!609969) (index!43117 lt!609969) (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1387966 () Bool)

(assert (=> b!1387966 (= e!786234 Undefined!10186)))

(declare-fun b!1387967 () Bool)

(assert (=> b!1387967 (= e!786233 (Found!10186 (index!43117 lt!609969)))))

(declare-fun d!149631 () Bool)

(declare-fun lt!609971 () SeekEntryResult!10186)

(assert (=> d!149631 (and (or ((_ is Undefined!10186) lt!609971) (not ((_ is Found!10186) lt!609971)) (and (bvsge (index!43116 lt!609971) #b00000000000000000000000000000000) (bvslt (index!43116 lt!609971) (size!46369 a!2938)))) (or ((_ is Undefined!10186) lt!609971) ((_ is Found!10186) lt!609971) (not ((_ is MissingZero!10186) lt!609971)) (and (bvsge (index!43115 lt!609971) #b00000000000000000000000000000000) (bvslt (index!43115 lt!609971) (size!46369 a!2938)))) (or ((_ is Undefined!10186) lt!609971) ((_ is Found!10186) lt!609971) ((_ is MissingZero!10186) lt!609971) (not ((_ is MissingVacant!10186) lt!609971)) (and (bvsge (index!43118 lt!609971) #b00000000000000000000000000000000) (bvslt (index!43118 lt!609971) (size!46369 a!2938)))) (or ((_ is Undefined!10186) lt!609971) (ite ((_ is Found!10186) lt!609971) (= (select (arr!45817 a!2938) (index!43116 lt!609971)) (select (arr!45817 a!2938) startIndex!16)) (ite ((_ is MissingZero!10186) lt!609971) (= (select (arr!45817 a!2938) (index!43115 lt!609971)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10186) lt!609971) (= (select (arr!45817 a!2938) (index!43118 lt!609971)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149631 (= lt!609971 e!786234)))

(declare-fun c!129132 () Bool)

(assert (=> d!149631 (= c!129132 (and ((_ is Intermediate!10186) lt!609969) (undefined!10998 lt!609969)))))

(assert (=> d!149631 (= lt!609969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45817 a!2938) startIndex!16) mask!2987) (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (=> d!149631 (validMask!0 mask!2987)))

(assert (=> d!149631 (= (seekEntryOrOpen!0 (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987) lt!609971)))

(declare-fun b!1387968 () Bool)

(declare-fun c!129133 () Bool)

(assert (=> b!1387968 (= c!129133 (= lt!609970 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387968 (= e!786233 e!786235)))

(assert (= (and d!149631 c!129132) b!1387966))

(assert (= (and d!149631 (not c!129132)) b!1387964))

(assert (= (and b!1387964 c!129134) b!1387967))

(assert (= (and b!1387964 (not c!129134)) b!1387968))

(assert (= (and b!1387968 c!129133) b!1387963))

(assert (= (and b!1387968 (not c!129133)) b!1387965))

(declare-fun m!1273191 () Bool)

(assert (=> b!1387964 m!1273191))

(assert (=> b!1387965 m!1273049))

(declare-fun m!1273193 () Bool)

(assert (=> b!1387965 m!1273193))

(assert (=> d!149631 m!1273049))

(declare-fun m!1273195 () Bool)

(assert (=> d!149631 m!1273195))

(declare-fun m!1273197 () Bool)

(assert (=> d!149631 m!1273197))

(declare-fun m!1273199 () Bool)

(assert (=> d!149631 m!1273199))

(assert (=> d!149631 m!1273041))

(declare-fun m!1273201 () Bool)

(assert (=> d!149631 m!1273201))

(assert (=> d!149631 m!1273195))

(assert (=> d!149631 m!1273049))

(declare-fun m!1273203 () Bool)

(assert (=> d!149631 m!1273203))

(assert (=> b!1387828 d!149631))

(declare-fun d!149633 () Bool)

(assert (=> d!149633 (= (validKeyInArray!0 (select (arr!45817 a!2938) startIndex!16)) (and (not (= (select (arr!45817 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45817 a!2938) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387823 d!149633))

(declare-fun d!149635 () Bool)

(assert (=> d!149635 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118760 d!149635))

(declare-fun d!149637 () Bool)

(assert (=> d!149637 (= (array_inv!35050 a!2938) (bvsge (size!46369 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118760 d!149637))

(declare-fun b!1388004 () Bool)

(declare-fun e!786260 () Bool)

(declare-fun call!66595 () Bool)

(assert (=> b!1388004 (= e!786260 call!66595)))

(declare-fun b!1388005 () Bool)

(declare-fun e!786262 () Bool)

(declare-fun contains!9710 (List!32423 (_ BitVec 64)) Bool)

(assert (=> b!1388005 (= e!786262 (contains!9710 Nil!32420 (select (arr!45817 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388006 () Bool)

(declare-fun e!786261 () Bool)

(declare-fun e!786259 () Bool)

(assert (=> b!1388006 (= e!786261 e!786259)))

(declare-fun res!928599 () Bool)

(assert (=> b!1388006 (=> (not res!928599) (not e!786259))))

(assert (=> b!1388006 (= res!928599 (not e!786262))))

(declare-fun res!928600 () Bool)

(assert (=> b!1388006 (=> (not res!928600) (not e!786262))))

(assert (=> b!1388006 (= res!928600 (validKeyInArray!0 (select (arr!45817 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388007 () Bool)

(assert (=> b!1388007 (= e!786260 call!66595)))

(declare-fun bm!66592 () Bool)

(declare-fun c!129147 () Bool)

(assert (=> bm!66592 (= call!66595 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129147 (Cons!32419 (select (arr!45817 a!2938) #b00000000000000000000000000000000) Nil!32420) Nil!32420)))))

(declare-fun d!149643 () Bool)

(declare-fun res!928598 () Bool)

(assert (=> d!149643 (=> res!928598 e!786261)))

(assert (=> d!149643 (= res!928598 (bvsge #b00000000000000000000000000000000 (size!46369 a!2938)))))

(assert (=> d!149643 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32420) e!786261)))

(declare-fun b!1388008 () Bool)

(assert (=> b!1388008 (= e!786259 e!786260)))

(assert (=> b!1388008 (= c!129147 (validKeyInArray!0 (select (arr!45817 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149643 (not res!928598)) b!1388006))

(assert (= (and b!1388006 res!928600) b!1388005))

(assert (= (and b!1388006 res!928599) b!1388008))

(assert (= (and b!1388008 c!129147) b!1388004))

(assert (= (and b!1388008 (not c!129147)) b!1388007))

(assert (= (or b!1388004 b!1388007) bm!66592))

(declare-fun m!1273231 () Bool)

(assert (=> b!1388005 m!1273231))

(assert (=> b!1388005 m!1273231))

(declare-fun m!1273233 () Bool)

(assert (=> b!1388005 m!1273233))

(assert (=> b!1388006 m!1273231))

(assert (=> b!1388006 m!1273231))

(declare-fun m!1273235 () Bool)

(assert (=> b!1388006 m!1273235))

(assert (=> bm!66592 m!1273231))

(declare-fun m!1273237 () Bool)

(assert (=> bm!66592 m!1273237))

(assert (=> b!1388008 m!1273231))

(assert (=> b!1388008 m!1273231))

(assert (=> b!1388008 m!1273235))

(assert (=> b!1387827 d!149643))

(declare-fun b!1388009 () Bool)

(declare-fun e!786264 () Bool)

(declare-fun e!786265 () Bool)

(assert (=> b!1388009 (= e!786264 e!786265)))

(declare-fun lt!609992 () (_ BitVec 64))

(assert (=> b!1388009 (= lt!609992 (select (arr!45817 lt!609898) startIndex!16))))

(declare-fun lt!609990 () Unit!46242)

(assert (=> b!1388009 (= lt!609990 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609898 lt!609992 startIndex!16))))

(assert (=> b!1388009 (arrayContainsKey!0 lt!609898 lt!609992 #b00000000000000000000000000000000)))

(declare-fun lt!609991 () Unit!46242)

(assert (=> b!1388009 (= lt!609991 lt!609990)))

(declare-fun res!928602 () Bool)

(assert (=> b!1388009 (= res!928602 (= (seekEntryOrOpen!0 (select (arr!45817 lt!609898) startIndex!16) lt!609898 mask!2987) (Found!10186 startIndex!16)))))

(assert (=> b!1388009 (=> (not res!928602) (not e!786265))))

(declare-fun b!1388010 () Bool)

(declare-fun e!786263 () Bool)

(assert (=> b!1388010 (= e!786263 e!786264)))

(declare-fun c!129148 () Bool)

(assert (=> b!1388010 (= c!129148 (validKeyInArray!0 (select (arr!45817 lt!609898) startIndex!16)))))

(declare-fun call!66596 () Bool)

(declare-fun bm!66593 () Bool)

(assert (=> bm!66593 (= call!66596 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!609898 mask!2987))))

(declare-fun d!149649 () Bool)

(declare-fun res!928601 () Bool)

(assert (=> d!149649 (=> res!928601 e!786263)))

(assert (=> d!149649 (= res!928601 (bvsge startIndex!16 (size!46369 lt!609898)))))

(assert (=> d!149649 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!609898 mask!2987) e!786263)))

(declare-fun b!1388011 () Bool)

(assert (=> b!1388011 (= e!786264 call!66596)))

(declare-fun b!1388012 () Bool)

(assert (=> b!1388012 (= e!786265 call!66596)))

(assert (= (and d!149649 (not res!928601)) b!1388010))

(assert (= (and b!1388010 c!129148) b!1388009))

(assert (= (and b!1388010 (not c!129148)) b!1388011))

(assert (= (and b!1388009 res!928602) b!1388012))

(assert (= (or b!1388012 b!1388011) bm!66593))

(declare-fun m!1273239 () Bool)

(assert (=> b!1388009 m!1273239))

(declare-fun m!1273241 () Bool)

(assert (=> b!1388009 m!1273241))

(declare-fun m!1273243 () Bool)

(assert (=> b!1388009 m!1273243))

(assert (=> b!1388009 m!1273239))

(declare-fun m!1273245 () Bool)

(assert (=> b!1388009 m!1273245))

(assert (=> b!1388010 m!1273239))

(assert (=> b!1388010 m!1273239))

(declare-fun m!1273247 () Bool)

(assert (=> b!1388010 m!1273247))

(declare-fun m!1273249 () Bool)

(assert (=> bm!66593 m!1273249))

(assert (=> b!1387825 d!149649))

(declare-fun d!149651 () Bool)

(assert (=> d!149651 (= (validKeyInArray!0 (select (arr!45817 a!2938) i!1065)) (and (not (= (select (arr!45817 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45817 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387829 d!149651))

(declare-fun b!1388013 () Bool)

(declare-fun e!786267 () Bool)

(declare-fun e!786268 () Bool)

(assert (=> b!1388013 (= e!786267 e!786268)))

(declare-fun lt!609995 () (_ BitVec 64))

(assert (=> b!1388013 (= lt!609995 (select (arr!45817 a!2938) #b00000000000000000000000000000000))))

(declare-fun lt!609993 () Unit!46242)

(assert (=> b!1388013 (= lt!609993 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609995 #b00000000000000000000000000000000))))

(assert (=> b!1388013 (arrayContainsKey!0 a!2938 lt!609995 #b00000000000000000000000000000000)))

(declare-fun lt!609994 () Unit!46242)

(assert (=> b!1388013 (= lt!609994 lt!609993)))

(declare-fun res!928604 () Bool)

(assert (=> b!1388013 (= res!928604 (= (seekEntryOrOpen!0 (select (arr!45817 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10186 #b00000000000000000000000000000000)))))

(assert (=> b!1388013 (=> (not res!928604) (not e!786268))))

(declare-fun b!1388014 () Bool)

(declare-fun e!786266 () Bool)

(assert (=> b!1388014 (= e!786266 e!786267)))

(declare-fun c!129149 () Bool)

(assert (=> b!1388014 (= c!129149 (validKeyInArray!0 (select (arr!45817 a!2938) #b00000000000000000000000000000000)))))

(declare-fun bm!66594 () Bool)

(declare-fun call!66597 () Bool)

(assert (=> bm!66594 (= call!66597 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149653 () Bool)

(declare-fun res!928603 () Bool)

(assert (=> d!149653 (=> res!928603 e!786266)))

(assert (=> d!149653 (= res!928603 (bvsge #b00000000000000000000000000000000 (size!46369 a!2938)))))

(assert (=> d!149653 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!786266)))

(declare-fun b!1388015 () Bool)

(assert (=> b!1388015 (= e!786267 call!66597)))

(declare-fun b!1388016 () Bool)

(assert (=> b!1388016 (= e!786268 call!66597)))

(assert (= (and d!149653 (not res!928603)) b!1388014))

(assert (= (and b!1388014 c!129149) b!1388013))

(assert (= (and b!1388014 (not c!129149)) b!1388015))

(assert (= (and b!1388013 res!928604) b!1388016))

(assert (= (or b!1388016 b!1388015) bm!66594))

(assert (=> b!1388013 m!1273231))

(declare-fun m!1273251 () Bool)

(assert (=> b!1388013 m!1273251))

(declare-fun m!1273253 () Bool)

(assert (=> b!1388013 m!1273253))

(assert (=> b!1388013 m!1273231))

(declare-fun m!1273255 () Bool)

(assert (=> b!1388013 m!1273255))

(assert (=> b!1388014 m!1273231))

(assert (=> b!1388014 m!1273231))

(assert (=> b!1388014 m!1273235))

(declare-fun m!1273257 () Bool)

(assert (=> bm!66594 m!1273257))

(assert (=> b!1387824 d!149653))

(check-sat (not d!149607) (not b!1387965) (not b!1388014) (not b!1387933) (not b!1387905) (not bm!66592) (not d!149631) (not b!1388013) (not b!1387962) (not b!1388010) (not b!1388008) (not bm!66593) (not bm!66594) (not b!1388005) (not b!1387932) (not d!149623) (not bm!66582) (not d!149609) (not b!1388009) (not b!1388006))
(check-sat)
(get-model)

(declare-fun d!149679 () Bool)

(assert (=> d!149679 (= (validKeyInArray!0 (select (arr!45817 a!2938) #b00000000000000000000000000000000)) (and (not (= (select (arr!45817 a!2938) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45817 a!2938) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388006 d!149679))

(declare-fun b!1388095 () Bool)

(declare-fun lt!610028 () SeekEntryResult!10186)

(assert (=> b!1388095 (and (bvsge (index!43117 lt!610028) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610028) (size!46369 lt!609898)))))

(declare-fun e!786318 () Bool)

(assert (=> b!1388095 (= e!786318 (= (select (arr!45817 lt!609898) (index!43117 lt!610028)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388096 () Bool)

(declare-fun e!786319 () SeekEntryResult!10186)

(assert (=> b!1388096 (= e!786319 (Intermediate!10186 false (toIndex!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388097 () Bool)

(declare-fun e!786322 () Bool)

(assert (=> b!1388097 (= e!786322 (bvsge (x!124729 lt!610028) #b01111111111111111111111111111110))))

(declare-fun b!1388098 () Bool)

(declare-fun e!786320 () SeekEntryResult!10186)

(assert (=> b!1388098 (= e!786320 e!786319)))

(declare-fun lt!610027 () (_ BitVec 64))

(declare-fun c!129178 () Bool)

(assert (=> b!1388098 (= c!129178 (or (= lt!610027 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (= (bvadd lt!610027 lt!610027) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1388099 () Bool)

(assert (=> b!1388099 (and (bvsge (index!43117 lt!610028) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610028) (size!46369 lt!609898)))))

(declare-fun res!928630 () Bool)

(assert (=> b!1388099 (= res!928630 (= (select (arr!45817 lt!609898) (index!43117 lt!610028)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388099 (=> res!928630 e!786318)))

(declare-fun b!1388100 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1388100 (= e!786319 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609898 mask!2987))))

(declare-fun b!1388102 () Bool)

(declare-fun e!786321 () Bool)

(assert (=> b!1388102 (= e!786322 e!786321)))

(declare-fun res!928629 () Bool)

(assert (=> b!1388102 (= res!928629 (and ((_ is Intermediate!10186) lt!610028) (not (undefined!10998 lt!610028)) (bvslt (x!124729 lt!610028) #b01111111111111111111111111111110) (bvsge (x!124729 lt!610028) #b00000000000000000000000000000000) (bvsge (x!124729 lt!610028) #b00000000000000000000000000000000)))))

(assert (=> b!1388102 (=> (not res!928629) (not e!786321))))

(declare-fun b!1388103 () Bool)

(assert (=> b!1388103 (and (bvsge (index!43117 lt!610028) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610028) (size!46369 lt!609898)))))

(declare-fun res!928631 () Bool)

(assert (=> b!1388103 (= res!928631 (= (select (arr!45817 lt!609898) (index!43117 lt!610028)) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(assert (=> b!1388103 (=> res!928631 e!786318)))

(assert (=> b!1388103 (= e!786321 e!786318)))

(declare-fun d!149681 () Bool)

(assert (=> d!149681 e!786322))

(declare-fun c!129177 () Bool)

(assert (=> d!149681 (= c!129177 (and ((_ is Intermediate!10186) lt!610028) (undefined!10998 lt!610028)))))

(assert (=> d!149681 (= lt!610028 e!786320)))

(declare-fun c!129179 () Bool)

(assert (=> d!149681 (= c!129179 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!149681 (= lt!610027 (select (arr!45817 lt!609898) (toIndex!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987)))))

(assert (=> d!149681 (validMask!0 mask!2987)))

(assert (=> d!149681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609898 mask!2987) lt!610028)))

(declare-fun b!1388101 () Bool)

(assert (=> b!1388101 (= e!786320 (Intermediate!10186 true (toIndex!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(assert (= (and d!149681 c!129179) b!1388101))

(assert (= (and d!149681 (not c!129179)) b!1388098))

(assert (= (and b!1388098 c!129178) b!1388096))

(assert (= (and b!1388098 (not c!129178)) b!1388100))

(assert (= (and d!149681 c!129177) b!1388097))

(assert (= (and d!149681 (not c!129177)) b!1388102))

(assert (= (and b!1388102 res!928629) b!1388103))

(assert (= (and b!1388103 (not res!928631)) b!1388099))

(assert (= (and b!1388099 (not res!928630)) b!1388095))

(declare-fun m!1273341 () Bool)

(assert (=> b!1388099 m!1273341))

(assert (=> b!1388095 m!1273341))

(assert (=> b!1388100 m!1273141))

(declare-fun m!1273343 () Bool)

(assert (=> b!1388100 m!1273343))

(assert (=> b!1388100 m!1273343))

(assert (=> b!1388100 m!1273057))

(declare-fun m!1273345 () Bool)

(assert (=> b!1388100 m!1273345))

(assert (=> b!1388103 m!1273341))

(assert (=> d!149681 m!1273141))

(declare-fun m!1273347 () Bool)

(assert (=> d!149681 m!1273347))

(assert (=> d!149681 m!1273041))

(assert (=> d!149607 d!149681))

(declare-fun d!149683 () Bool)

(declare-fun lt!610034 () (_ BitVec 32))

(declare-fun lt!610033 () (_ BitVec 32))

(assert (=> d!149683 (= lt!610034 (bvmul (bvxor lt!610033 (bvlshr lt!610033 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149683 (= lt!610033 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149683 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928632 (let ((h!33634 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124733 (bvmul (bvxor h!33634 (bvlshr h!33634 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124733 (bvlshr x!124733 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928632 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928632 #b00000000000000000000000000000000))))))

(assert (=> d!149683 (= (toIndex!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvand (bvxor lt!610034 (bvlshr lt!610034 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149607 d!149683))

(assert (=> d!149607 d!149635))

(declare-fun d!149685 () Bool)

(declare-fun lt!610037 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!760 (List!32423) (InoxSet (_ BitVec 64)))

(assert (=> d!149685 (= lt!610037 (select (content!760 Nil!32420) (select (arr!45817 a!2938) #b00000000000000000000000000000000)))))

(declare-fun e!786328 () Bool)

(assert (=> d!149685 (= lt!610037 e!786328)))

(declare-fun res!928638 () Bool)

(assert (=> d!149685 (=> (not res!928638) (not e!786328))))

(assert (=> d!149685 (= res!928638 ((_ is Cons!32419) Nil!32420))))

(assert (=> d!149685 (= (contains!9710 Nil!32420 (select (arr!45817 a!2938) #b00000000000000000000000000000000)) lt!610037)))

(declare-fun b!1388108 () Bool)

(declare-fun e!786327 () Bool)

(assert (=> b!1388108 (= e!786328 e!786327)))

(declare-fun res!928637 () Bool)

(assert (=> b!1388108 (=> res!928637 e!786327)))

(assert (=> b!1388108 (= res!928637 (= (h!33631 Nil!32420) (select (arr!45817 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388109 () Bool)

(assert (=> b!1388109 (= e!786327 (contains!9710 (t!47109 Nil!32420) (select (arr!45817 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149685 res!928638) b!1388108))

(assert (= (and b!1388108 (not res!928637)) b!1388109))

(declare-fun m!1273349 () Bool)

(assert (=> d!149685 m!1273349))

(assert (=> d!149685 m!1273231))

(declare-fun m!1273351 () Bool)

(assert (=> d!149685 m!1273351))

(assert (=> b!1388109 m!1273231))

(declare-fun m!1273353 () Bool)

(assert (=> b!1388109 m!1273353))

(assert (=> b!1388005 d!149685))

(declare-fun b!1388122 () Bool)

(declare-fun e!786336 () SeekEntryResult!10186)

(assert (=> b!1388122 (= e!786336 Undefined!10186)))

(declare-fun b!1388123 () Bool)

(declare-fun e!786337 () SeekEntryResult!10186)

(assert (=> b!1388123 (= e!786337 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124729 lt!609969) #b00000000000000000000000000000001) (nextIndex!0 (index!43117 lt!609969) (x!124729 lt!609969) mask!2987) (index!43117 lt!609969) (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388124 () Bool)

(declare-fun e!786335 () SeekEntryResult!10186)

(assert (=> b!1388124 (= e!786335 (Found!10186 (index!43117 lt!609969)))))

(declare-fun b!1388125 () Bool)

(assert (=> b!1388125 (= e!786337 (MissingVacant!10186 (index!43117 lt!609969)))))

(declare-fun b!1388126 () Bool)

(assert (=> b!1388126 (= e!786336 e!786335)))

(declare-fun c!129186 () Bool)

(declare-fun lt!610043 () (_ BitVec 64))

(assert (=> b!1388126 (= c!129186 (= lt!610043 (select (arr!45817 a!2938) startIndex!16)))))

(declare-fun b!1388127 () Bool)

(declare-fun c!129188 () Bool)

(assert (=> b!1388127 (= c!129188 (= lt!610043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388127 (= e!786335 e!786337)))

(declare-fun d!149687 () Bool)

(declare-fun lt!610042 () SeekEntryResult!10186)

(assert (=> d!149687 (and (or ((_ is Undefined!10186) lt!610042) (not ((_ is Found!10186) lt!610042)) (and (bvsge (index!43116 lt!610042) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610042) (size!46369 a!2938)))) (or ((_ is Undefined!10186) lt!610042) ((_ is Found!10186) lt!610042) (not ((_ is MissingVacant!10186) lt!610042)) (not (= (index!43118 lt!610042) (index!43117 lt!609969))) (and (bvsge (index!43118 lt!610042) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610042) (size!46369 a!2938)))) (or ((_ is Undefined!10186) lt!610042) (ite ((_ is Found!10186) lt!610042) (= (select (arr!45817 a!2938) (index!43116 lt!610042)) (select (arr!45817 a!2938) startIndex!16)) (and ((_ is MissingVacant!10186) lt!610042) (= (index!43118 lt!610042) (index!43117 lt!609969)) (= (select (arr!45817 a!2938) (index!43118 lt!610042)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149687 (= lt!610042 e!786336)))

(declare-fun c!129187 () Bool)

(assert (=> d!149687 (= c!129187 (bvsge (x!124729 lt!609969) #b01111111111111111111111111111110))))

(assert (=> d!149687 (= lt!610043 (select (arr!45817 a!2938) (index!43117 lt!609969)))))

(assert (=> d!149687 (validMask!0 mask!2987)))

(assert (=> d!149687 (= (seekKeyOrZeroReturnVacant!0 (x!124729 lt!609969) (index!43117 lt!609969) (index!43117 lt!609969) (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987) lt!610042)))

(assert (= (and d!149687 c!129187) b!1388122))

(assert (= (and d!149687 (not c!129187)) b!1388126))

(assert (= (and b!1388126 c!129186) b!1388124))

(assert (= (and b!1388126 (not c!129186)) b!1388127))

(assert (= (and b!1388127 c!129188) b!1388125))

(assert (= (and b!1388127 (not c!129188)) b!1388123))

(declare-fun m!1273355 () Bool)

(assert (=> b!1388123 m!1273355))

(assert (=> b!1388123 m!1273355))

(assert (=> b!1388123 m!1273049))

(declare-fun m!1273357 () Bool)

(assert (=> b!1388123 m!1273357))

(declare-fun m!1273359 () Bool)

(assert (=> d!149687 m!1273359))

(declare-fun m!1273361 () Bool)

(assert (=> d!149687 m!1273361))

(assert (=> d!149687 m!1273191))

(assert (=> d!149687 m!1273041))

(assert (=> b!1387965 d!149687))

(declare-fun b!1388128 () Bool)

(declare-fun e!786339 () SeekEntryResult!10186)

(assert (=> b!1388128 (= e!786339 Undefined!10186)))

(declare-fun b!1388129 () Bool)

(declare-fun e!786340 () SeekEntryResult!10186)

(assert (=> b!1388129 (= e!786340 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124729 lt!609930) #b00000000000000000000000000000001) (nextIndex!0 (index!43117 lt!609930) (x!124729 lt!609930) mask!2987) (index!43117 lt!609930) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609898 mask!2987))))

(declare-fun b!1388130 () Bool)

(declare-fun e!786338 () SeekEntryResult!10186)

(assert (=> b!1388130 (= e!786338 (Found!10186 (index!43117 lt!609930)))))

(declare-fun b!1388131 () Bool)

(assert (=> b!1388131 (= e!786340 (MissingVacant!10186 (index!43117 lt!609930)))))

(declare-fun b!1388132 () Bool)

(assert (=> b!1388132 (= e!786339 e!786338)))

(declare-fun lt!610045 () (_ BitVec 64))

(declare-fun c!129189 () Bool)

(assert (=> b!1388132 (= c!129189 (= lt!610045 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1388133 () Bool)

(declare-fun c!129191 () Bool)

(assert (=> b!1388133 (= c!129191 (= lt!610045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388133 (= e!786338 e!786340)))

(declare-fun d!149689 () Bool)

(declare-fun lt!610044 () SeekEntryResult!10186)

(assert (=> d!149689 (and (or ((_ is Undefined!10186) lt!610044) (not ((_ is Found!10186) lt!610044)) (and (bvsge (index!43116 lt!610044) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610044) (size!46369 lt!609898)))) (or ((_ is Undefined!10186) lt!610044) ((_ is Found!10186) lt!610044) (not ((_ is MissingVacant!10186) lt!610044)) (not (= (index!43118 lt!610044) (index!43117 lt!609930))) (and (bvsge (index!43118 lt!610044) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610044) (size!46369 lt!609898)))) (or ((_ is Undefined!10186) lt!610044) (ite ((_ is Found!10186) lt!610044) (= (select (arr!45817 lt!609898) (index!43116 lt!610044)) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (and ((_ is MissingVacant!10186) lt!610044) (= (index!43118 lt!610044) (index!43117 lt!609930)) (= (select (arr!45817 lt!609898) (index!43118 lt!610044)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!149689 (= lt!610044 e!786339)))

(declare-fun c!129190 () Bool)

(assert (=> d!149689 (= c!129190 (bvsge (x!124729 lt!609930) #b01111111111111111111111111111110))))

(assert (=> d!149689 (= lt!610045 (select (arr!45817 lt!609898) (index!43117 lt!609930)))))

(assert (=> d!149689 (validMask!0 mask!2987)))

(assert (=> d!149689 (= (seekKeyOrZeroReturnVacant!0 (x!124729 lt!609930) (index!43117 lt!609930) (index!43117 lt!609930) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609898 mask!2987) lt!610044)))

(assert (= (and d!149689 c!129190) b!1388128))

(assert (= (and d!149689 (not c!129190)) b!1388132))

(assert (= (and b!1388132 c!129189) b!1388130))

(assert (= (and b!1388132 (not c!129189)) b!1388133))

(assert (= (and b!1388133 c!129191) b!1388131))

(assert (= (and b!1388133 (not c!129191)) b!1388129))

(declare-fun m!1273363 () Bool)

(assert (=> b!1388129 m!1273363))

(assert (=> b!1388129 m!1273363))

(assert (=> b!1388129 m!1273057))

(declare-fun m!1273365 () Bool)

(assert (=> b!1388129 m!1273365))

(declare-fun m!1273367 () Bool)

(assert (=> d!149689 m!1273367))

(declare-fun m!1273369 () Bool)

(assert (=> d!149689 m!1273369))

(assert (=> d!149689 m!1273137))

(assert (=> d!149689 m!1273041))

(assert (=> b!1387905 d!149689))

(declare-fun b!1388134 () Bool)

(declare-fun lt!610047 () SeekEntryResult!10186)

(assert (=> b!1388134 (and (bvsge (index!43117 lt!610047) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610047) (size!46369 a!2938)))))

(declare-fun e!786341 () Bool)

(assert (=> b!1388134 (= e!786341 (= (select (arr!45817 a!2938) (index!43117 lt!610047)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388135 () Bool)

(declare-fun e!786342 () SeekEntryResult!10186)

(assert (=> b!1388135 (= e!786342 (Intermediate!10186 false (toIndex!0 (select (arr!45817 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1388136 () Bool)

(declare-fun e!786345 () Bool)

(assert (=> b!1388136 (= e!786345 (bvsge (x!124729 lt!610047) #b01111111111111111111111111111110))))

(declare-fun b!1388137 () Bool)

(declare-fun e!786343 () SeekEntryResult!10186)

(assert (=> b!1388137 (= e!786343 e!786342)))

(declare-fun c!129193 () Bool)

(declare-fun lt!610046 () (_ BitVec 64))

(assert (=> b!1388137 (= c!129193 (or (= lt!610046 (select (arr!45817 a!2938) startIndex!16)) (= (bvadd lt!610046 lt!610046) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1388138 () Bool)

(assert (=> b!1388138 (and (bvsge (index!43117 lt!610047) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610047) (size!46369 a!2938)))))

(declare-fun res!928640 () Bool)

(assert (=> b!1388138 (= res!928640 (= (select (arr!45817 a!2938) (index!43117 lt!610047)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388138 (=> res!928640 e!786341)))

(declare-fun b!1388139 () Bool)

(assert (=> b!1388139 (= e!786342 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45817 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000 mask!2987) (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1388141 () Bool)

(declare-fun e!786344 () Bool)

(assert (=> b!1388141 (= e!786345 e!786344)))

(declare-fun res!928639 () Bool)

(assert (=> b!1388141 (= res!928639 (and ((_ is Intermediate!10186) lt!610047) (not (undefined!10998 lt!610047)) (bvslt (x!124729 lt!610047) #b01111111111111111111111111111110) (bvsge (x!124729 lt!610047) #b00000000000000000000000000000000) (bvsge (x!124729 lt!610047) #b00000000000000000000000000000000)))))

(assert (=> b!1388141 (=> (not res!928639) (not e!786344))))

(declare-fun b!1388142 () Bool)

(assert (=> b!1388142 (and (bvsge (index!43117 lt!610047) #b00000000000000000000000000000000) (bvslt (index!43117 lt!610047) (size!46369 a!2938)))))

(declare-fun res!928641 () Bool)

(assert (=> b!1388142 (= res!928641 (= (select (arr!45817 a!2938) (index!43117 lt!610047)) (select (arr!45817 a!2938) startIndex!16)))))

(assert (=> b!1388142 (=> res!928641 e!786341)))

(assert (=> b!1388142 (= e!786344 e!786341)))

(declare-fun d!149691 () Bool)

(assert (=> d!149691 e!786345))

(declare-fun c!129192 () Bool)

(assert (=> d!149691 (= c!129192 (and ((_ is Intermediate!10186) lt!610047) (undefined!10998 lt!610047)))))

(assert (=> d!149691 (= lt!610047 e!786343)))

(declare-fun c!129194 () Bool)

(assert (=> d!149691 (= c!129194 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!149691 (= lt!610046 (select (arr!45817 a!2938) (toIndex!0 (select (arr!45817 a!2938) startIndex!16) mask!2987)))))

(assert (=> d!149691 (validMask!0 mask!2987)))

(assert (=> d!149691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45817 a!2938) startIndex!16) mask!2987) (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987) lt!610047)))

(declare-fun b!1388140 () Bool)

(assert (=> b!1388140 (= e!786343 (Intermediate!10186 true (toIndex!0 (select (arr!45817 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(assert (= (and d!149691 c!129194) b!1388140))

(assert (= (and d!149691 (not c!129194)) b!1388137))

(assert (= (and b!1388137 c!129193) b!1388135))

(assert (= (and b!1388137 (not c!129193)) b!1388139))

(assert (= (and d!149691 c!129192) b!1388136))

(assert (= (and d!149691 (not c!129192)) b!1388141))

(assert (= (and b!1388141 res!928639) b!1388142))

(assert (= (and b!1388142 (not res!928641)) b!1388138))

(assert (= (and b!1388138 (not res!928640)) b!1388134))

(declare-fun m!1273371 () Bool)

(assert (=> b!1388138 m!1273371))

(assert (=> b!1388134 m!1273371))

(assert (=> b!1388139 m!1273195))

(declare-fun m!1273373 () Bool)

(assert (=> b!1388139 m!1273373))

(assert (=> b!1388139 m!1273373))

(assert (=> b!1388139 m!1273049))

(declare-fun m!1273375 () Bool)

(assert (=> b!1388139 m!1273375))

(assert (=> b!1388142 m!1273371))

(assert (=> d!149691 m!1273195))

(declare-fun m!1273377 () Bool)

(assert (=> d!149691 m!1273377))

(assert (=> d!149691 m!1273041))

(assert (=> d!149631 d!149691))

(declare-fun d!149693 () Bool)

(declare-fun lt!610049 () (_ BitVec 32))

(declare-fun lt!610048 () (_ BitVec 32))

(assert (=> d!149693 (= lt!610049 (bvmul (bvxor lt!610048 (bvlshr lt!610048 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!149693 (= lt!610048 ((_ extract 31 0) (bvand (bvxor (select (arr!45817 a!2938) startIndex!16) (bvlshr (select (arr!45817 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!149693 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!928632 (let ((h!33634 ((_ extract 31 0) (bvand (bvxor (select (arr!45817 a!2938) startIndex!16) (bvlshr (select (arr!45817 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124733 (bvmul (bvxor h!33634 (bvlshr h!33634 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124733 (bvlshr x!124733 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!928632 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!928632 #b00000000000000000000000000000000))))))

(assert (=> d!149693 (= (toIndex!0 (select (arr!45817 a!2938) startIndex!16) mask!2987) (bvand (bvxor lt!610049 (bvlshr lt!610049 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!149631 d!149693))

(assert (=> d!149631 d!149635))

(declare-fun b!1388143 () Bool)

(declare-fun e!786347 () Bool)

(declare-fun e!786348 () Bool)

(assert (=> b!1388143 (= e!786347 e!786348)))

(declare-fun lt!610052 () (_ BitVec 64))

(assert (=> b!1388143 (= lt!610052 (select (arr!45817 lt!609898) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610050 () Unit!46242)

(assert (=> b!1388143 (= lt!610050 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609898 lt!610052 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388143 (arrayContainsKey!0 lt!609898 lt!610052 #b00000000000000000000000000000000)))

(declare-fun lt!610051 () Unit!46242)

(assert (=> b!1388143 (= lt!610051 lt!610050)))

(declare-fun res!928643 () Bool)

(assert (=> b!1388143 (= res!928643 (= (seekEntryOrOpen!0 (select (arr!45817 lt!609898) (bvadd startIndex!16 #b00000000000000000000000000000001)) lt!609898 mask!2987) (Found!10186 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388143 (=> (not res!928643) (not e!786348))))

(declare-fun b!1388144 () Bool)

(declare-fun e!786346 () Bool)

(assert (=> b!1388144 (= e!786346 e!786347)))

(declare-fun c!129195 () Bool)

(assert (=> b!1388144 (= c!129195 (validKeyInArray!0 (select (arr!45817 lt!609898) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun call!66604 () Bool)

(declare-fun bm!66601 () Bool)

(assert (=> bm!66601 (= call!66604 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!609898 mask!2987))))

(declare-fun d!149695 () Bool)

(declare-fun res!928642 () Bool)

(assert (=> d!149695 (=> res!928642 e!786346)))

(assert (=> d!149695 (= res!928642 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46369 lt!609898)))))

(assert (=> d!149695 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!609898 mask!2987) e!786346)))

(declare-fun b!1388145 () Bool)

(assert (=> b!1388145 (= e!786347 call!66604)))

(declare-fun b!1388146 () Bool)

(assert (=> b!1388146 (= e!786348 call!66604)))

(assert (= (and d!149695 (not res!928642)) b!1388144))

(assert (= (and b!1388144 c!129195) b!1388143))

(assert (= (and b!1388144 (not c!129195)) b!1388145))

(assert (= (and b!1388143 res!928643) b!1388146))

(assert (= (or b!1388146 b!1388145) bm!66601))

(declare-fun m!1273379 () Bool)

(assert (=> b!1388143 m!1273379))

(declare-fun m!1273381 () Bool)

(assert (=> b!1388143 m!1273381))

(declare-fun m!1273383 () Bool)

(assert (=> b!1388143 m!1273383))

(assert (=> b!1388143 m!1273379))

(declare-fun m!1273385 () Bool)

(assert (=> b!1388143 m!1273385))

(assert (=> b!1388144 m!1273379))

(assert (=> b!1388144 m!1273379))

(declare-fun m!1273387 () Bool)

(assert (=> b!1388144 m!1273387))

(declare-fun m!1273389 () Bool)

(assert (=> bm!66601 m!1273389))

(assert (=> bm!66593 d!149695))

(assert (=> d!149609 d!149613))

(declare-fun d!149697 () Bool)

(assert (=> d!149697 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (=> d!149697 true))

(declare-fun _$72!134 () Unit!46242)

(assert (=> d!149697 (= (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) _$72!134)))

(declare-fun bs!40315 () Bool)

(assert (= bs!40315 d!149697))

(assert (=> bs!40315 m!1273067))

(assert (=> d!149609 d!149697))

(assert (=> d!149609 d!149635))

(declare-fun d!149699 () Bool)

(assert (=> d!149699 (= (seekEntryOrOpen!0 (select (arr!45817 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938)) mask!2987))))

(assert (=> d!149699 true))

(declare-fun _$42!25 () Unit!46242)

(assert (=> d!149699 (= (choose!14 a!2938 i!1065 startIndex!16 mask!2987) _$42!25)))

(declare-fun bs!40316 () Bool)

(assert (= bs!40316 d!149699))

(assert (=> bs!40316 m!1273057))

(assert (=> bs!40316 m!1273189))

(assert (=> bs!40316 m!1273049))

(assert (=> bs!40316 m!1273065))

(assert (=> bs!40316 m!1273057))

(assert (=> bs!40316 m!1273061))

(assert (=> bs!40316 m!1273049))

(assert (=> d!149623 d!149699))

(assert (=> d!149623 d!149635))

(assert (=> b!1387962 d!149631))

(declare-fun b!1388147 () Bool)

(declare-fun e!786351 () SeekEntryResult!10186)

(declare-fun lt!610053 () SeekEntryResult!10186)

(assert (=> b!1388147 (= e!786351 (MissingZero!10186 (index!43117 lt!610053)))))

(declare-fun b!1388148 () Bool)

(declare-fun e!786350 () SeekEntryResult!10186)

(declare-fun e!786349 () SeekEntryResult!10186)

(assert (=> b!1388148 (= e!786350 e!786349)))

(declare-fun lt!610054 () (_ BitVec 64))

(assert (=> b!1388148 (= lt!610054 (select (arr!45817 (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938))) (index!43117 lt!610053)))))

(declare-fun c!129198 () Bool)

(assert (=> b!1388148 (= c!129198 (= lt!610054 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1388149 () Bool)

(assert (=> b!1388149 (= e!786351 (seekKeyOrZeroReturnVacant!0 (x!124729 lt!610053) (index!43117 lt!610053) (index!43117 lt!610053) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938)) mask!2987))))

(declare-fun b!1388150 () Bool)

(assert (=> b!1388150 (= e!786350 Undefined!10186)))

(declare-fun b!1388151 () Bool)

(assert (=> b!1388151 (= e!786349 (Found!10186 (index!43117 lt!610053)))))

(declare-fun d!149701 () Bool)

(declare-fun lt!610055 () SeekEntryResult!10186)

(assert (=> d!149701 (and (or ((_ is Undefined!10186) lt!610055) (not ((_ is Found!10186) lt!610055)) (and (bvsge (index!43116 lt!610055) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610055) (size!46369 (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938)))))) (or ((_ is Undefined!10186) lt!610055) ((_ is Found!10186) lt!610055) (not ((_ is MissingZero!10186) lt!610055)) (and (bvsge (index!43115 lt!610055) #b00000000000000000000000000000000) (bvslt (index!43115 lt!610055) (size!46369 (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938)))))) (or ((_ is Undefined!10186) lt!610055) ((_ is Found!10186) lt!610055) ((_ is MissingZero!10186) lt!610055) (not ((_ is MissingVacant!10186) lt!610055)) (and (bvsge (index!43118 lt!610055) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610055) (size!46369 (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938)))))) (or ((_ is Undefined!10186) lt!610055) (ite ((_ is Found!10186) lt!610055) (= (select (arr!45817 (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938))) (index!43116 lt!610055)) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10186) lt!610055) (= (select (arr!45817 (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938))) (index!43115 lt!610055)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10186) lt!610055) (= (select (arr!45817 (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938))) (index!43118 lt!610055)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149701 (= lt!610055 e!786350)))

(declare-fun c!129196 () Bool)

(assert (=> d!149701 (= c!129196 (and ((_ is Intermediate!10186) lt!610053) (undefined!10998 lt!610053)))))

(assert (=> d!149701 (= lt!610053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938)) mask!2987))))

(assert (=> d!149701 (validMask!0 mask!2987)))

(assert (=> d!149701 (= (seekEntryOrOpen!0 (select (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94885 (store (arr!45817 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46369 a!2938)) mask!2987) lt!610055)))

(declare-fun b!1388152 () Bool)

(declare-fun c!129197 () Bool)

(assert (=> b!1388152 (= c!129197 (= lt!610054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388152 (= e!786349 e!786351)))

(assert (= (and d!149701 c!129196) b!1388150))

(assert (= (and d!149701 (not c!129196)) b!1388148))

(assert (= (and b!1388148 c!129198) b!1388151))

(assert (= (and b!1388148 (not c!129198)) b!1388152))

(assert (= (and b!1388152 c!129197) b!1388147))

(assert (= (and b!1388152 (not c!129197)) b!1388149))

(declare-fun m!1273391 () Bool)

(assert (=> b!1388148 m!1273391))

(assert (=> b!1388149 m!1273057))

(declare-fun m!1273393 () Bool)

(assert (=> b!1388149 m!1273393))

(assert (=> d!149701 m!1273057))

(assert (=> d!149701 m!1273141))

(declare-fun m!1273395 () Bool)

(assert (=> d!149701 m!1273395))

(declare-fun m!1273397 () Bool)

(assert (=> d!149701 m!1273397))

(assert (=> d!149701 m!1273041))

(declare-fun m!1273399 () Bool)

(assert (=> d!149701 m!1273399))

(assert (=> d!149701 m!1273141))

(assert (=> d!149701 m!1273057))

(declare-fun m!1273401 () Bool)

(assert (=> d!149701 m!1273401))

(assert (=> b!1387962 d!149701))

(assert (=> b!1388008 d!149679))

(declare-fun b!1388153 () Bool)

(declare-fun e!786353 () Bool)

(declare-fun e!786354 () Bool)

(assert (=> b!1388153 (= e!786353 e!786354)))

(declare-fun lt!610058 () (_ BitVec 64))

(assert (=> b!1388153 (= lt!610058 (select (arr!45817 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610056 () Unit!46242)

(assert (=> b!1388153 (= lt!610056 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610058 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1388153 (arrayContainsKey!0 a!2938 lt!610058 #b00000000000000000000000000000000)))

(declare-fun lt!610057 () Unit!46242)

(assert (=> b!1388153 (= lt!610057 lt!610056)))

(declare-fun res!928645 () Bool)

(assert (=> b!1388153 (= res!928645 (= (seekEntryOrOpen!0 (select (arr!45817 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10186 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1388153 (=> (not res!928645) (not e!786354))))

(declare-fun b!1388154 () Bool)

(declare-fun e!786352 () Bool)

(assert (=> b!1388154 (= e!786352 e!786353)))

(declare-fun c!129199 () Bool)

(assert (=> b!1388154 (= c!129199 (validKeyInArray!0 (select (arr!45817 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun call!66605 () Bool)

(declare-fun bm!66602 () Bool)

(assert (=> bm!66602 (= call!66605 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149703 () Bool)

(declare-fun res!928644 () Bool)

(assert (=> d!149703 (=> res!928644 e!786352)))

(assert (=> d!149703 (= res!928644 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46369 a!2938)))))

(assert (=> d!149703 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987) e!786352)))

(declare-fun b!1388155 () Bool)

(assert (=> b!1388155 (= e!786353 call!66605)))

(declare-fun b!1388156 () Bool)

(assert (=> b!1388156 (= e!786354 call!66605)))

(assert (= (and d!149703 (not res!928644)) b!1388154))

(assert (= (and b!1388154 c!129199) b!1388153))

(assert (= (and b!1388154 (not c!129199)) b!1388155))

(assert (= (and b!1388153 res!928645) b!1388156))

(assert (= (or b!1388156 b!1388155) bm!66602))

(declare-fun m!1273403 () Bool)

(assert (=> b!1388153 m!1273403))

(declare-fun m!1273405 () Bool)

(assert (=> b!1388153 m!1273405))

(declare-fun m!1273407 () Bool)

(assert (=> b!1388153 m!1273407))

(assert (=> b!1388153 m!1273403))

(declare-fun m!1273409 () Bool)

(assert (=> b!1388153 m!1273409))

(assert (=> b!1388154 m!1273403))

(assert (=> b!1388154 m!1273403))

(declare-fun m!1273411 () Bool)

(assert (=> b!1388154 m!1273411))

(declare-fun m!1273413 () Bool)

(assert (=> bm!66602 m!1273413))

(assert (=> bm!66582 d!149703))

(declare-fun d!149705 () Bool)

(assert (=> d!149705 (arrayContainsKey!0 a!2938 lt!609995 #b00000000000000000000000000000000)))

(declare-fun lt!610061 () Unit!46242)

(declare-fun choose!13 (array!94884 (_ BitVec 64) (_ BitVec 32)) Unit!46242)

(assert (=> d!149705 (= lt!610061 (choose!13 a!2938 lt!609995 #b00000000000000000000000000000000))))

(assert (=> d!149705 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!149705 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609995 #b00000000000000000000000000000000) lt!610061)))

(declare-fun bs!40317 () Bool)

(assert (= bs!40317 d!149705))

(assert (=> bs!40317 m!1273253))

(declare-fun m!1273415 () Bool)

(assert (=> bs!40317 m!1273415))

(assert (=> b!1388013 d!149705))

(declare-fun d!149707 () Bool)

(declare-fun res!928650 () Bool)

(declare-fun e!786359 () Bool)

(assert (=> d!149707 (=> res!928650 e!786359)))

(assert (=> d!149707 (= res!928650 (= (select (arr!45817 a!2938) #b00000000000000000000000000000000) lt!609995))))

(assert (=> d!149707 (= (arrayContainsKey!0 a!2938 lt!609995 #b00000000000000000000000000000000) e!786359)))

(declare-fun b!1388161 () Bool)

(declare-fun e!786360 () Bool)

(assert (=> b!1388161 (= e!786359 e!786360)))

(declare-fun res!928651 () Bool)

(assert (=> b!1388161 (=> (not res!928651) (not e!786360))))

(assert (=> b!1388161 (= res!928651 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46369 a!2938)))))

(declare-fun b!1388162 () Bool)

(assert (=> b!1388162 (= e!786360 (arrayContainsKey!0 a!2938 lt!609995 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149707 (not res!928650)) b!1388161))

(assert (= (and b!1388161 res!928651) b!1388162))

(assert (=> d!149707 m!1273231))

(declare-fun m!1273417 () Bool)

(assert (=> b!1388162 m!1273417))

(assert (=> b!1388013 d!149707))

(declare-fun b!1388163 () Bool)

(declare-fun e!786363 () SeekEntryResult!10186)

(declare-fun lt!610062 () SeekEntryResult!10186)

(assert (=> b!1388163 (= e!786363 (MissingZero!10186 (index!43117 lt!610062)))))

(declare-fun b!1388164 () Bool)

(declare-fun e!786362 () SeekEntryResult!10186)

(declare-fun e!786361 () SeekEntryResult!10186)

(assert (=> b!1388164 (= e!786362 e!786361)))

(declare-fun lt!610063 () (_ BitVec 64))

(assert (=> b!1388164 (= lt!610063 (select (arr!45817 a!2938) (index!43117 lt!610062)))))

(declare-fun c!129202 () Bool)

(assert (=> b!1388164 (= c!129202 (= lt!610063 (select (arr!45817 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1388165 () Bool)

(assert (=> b!1388165 (= e!786363 (seekKeyOrZeroReturnVacant!0 (x!124729 lt!610062) (index!43117 lt!610062) (index!43117 lt!610062) (select (arr!45817 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(declare-fun b!1388166 () Bool)

(assert (=> b!1388166 (= e!786362 Undefined!10186)))

(declare-fun b!1388167 () Bool)

(assert (=> b!1388167 (= e!786361 (Found!10186 (index!43117 lt!610062)))))

(declare-fun d!149709 () Bool)

(declare-fun lt!610064 () SeekEntryResult!10186)

(assert (=> d!149709 (and (or ((_ is Undefined!10186) lt!610064) (not ((_ is Found!10186) lt!610064)) (and (bvsge (index!43116 lt!610064) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610064) (size!46369 a!2938)))) (or ((_ is Undefined!10186) lt!610064) ((_ is Found!10186) lt!610064) (not ((_ is MissingZero!10186) lt!610064)) (and (bvsge (index!43115 lt!610064) #b00000000000000000000000000000000) (bvslt (index!43115 lt!610064) (size!46369 a!2938)))) (or ((_ is Undefined!10186) lt!610064) ((_ is Found!10186) lt!610064) ((_ is MissingZero!10186) lt!610064) (not ((_ is MissingVacant!10186) lt!610064)) (and (bvsge (index!43118 lt!610064) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610064) (size!46369 a!2938)))) (or ((_ is Undefined!10186) lt!610064) (ite ((_ is Found!10186) lt!610064) (= (select (arr!45817 a!2938) (index!43116 lt!610064)) (select (arr!45817 a!2938) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10186) lt!610064) (= (select (arr!45817 a!2938) (index!43115 lt!610064)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10186) lt!610064) (= (select (arr!45817 a!2938) (index!43118 lt!610064)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149709 (= lt!610064 e!786362)))

(declare-fun c!129200 () Bool)

(assert (=> d!149709 (= c!129200 (and ((_ is Intermediate!10186) lt!610062) (undefined!10998 lt!610062)))))

(assert (=> d!149709 (= lt!610062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45817 a!2938) #b00000000000000000000000000000000) mask!2987) (select (arr!45817 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(assert (=> d!149709 (validMask!0 mask!2987)))

(assert (=> d!149709 (= (seekEntryOrOpen!0 (select (arr!45817 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) lt!610064)))

(declare-fun b!1388168 () Bool)

(declare-fun c!129201 () Bool)

(assert (=> b!1388168 (= c!129201 (= lt!610063 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388168 (= e!786361 e!786363)))

(assert (= (and d!149709 c!129200) b!1388166))

(assert (= (and d!149709 (not c!129200)) b!1388164))

(assert (= (and b!1388164 c!129202) b!1388167))

(assert (= (and b!1388164 (not c!129202)) b!1388168))

(assert (= (and b!1388168 c!129201) b!1388163))

(assert (= (and b!1388168 (not c!129201)) b!1388165))

(declare-fun m!1273419 () Bool)

(assert (=> b!1388164 m!1273419))

(assert (=> b!1388165 m!1273231))

(declare-fun m!1273421 () Bool)

(assert (=> b!1388165 m!1273421))

(assert (=> d!149709 m!1273231))

(declare-fun m!1273423 () Bool)

(assert (=> d!149709 m!1273423))

(declare-fun m!1273425 () Bool)

(assert (=> d!149709 m!1273425))

(declare-fun m!1273427 () Bool)

(assert (=> d!149709 m!1273427))

(assert (=> d!149709 m!1273041))

(declare-fun m!1273429 () Bool)

(assert (=> d!149709 m!1273429))

(assert (=> d!149709 m!1273423))

(assert (=> d!149709 m!1273231))

(declare-fun m!1273431 () Bool)

(assert (=> d!149709 m!1273431))

(assert (=> b!1388013 d!149709))

(declare-fun d!149711 () Bool)

(assert (=> d!149711 (arrayContainsKey!0 a!2938 lt!609944 #b00000000000000000000000000000000)))

(declare-fun lt!610065 () Unit!46242)

(assert (=> d!149711 (= lt!610065 (choose!13 a!2938 lt!609944 startIndex!16))))

(assert (=> d!149711 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149711 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609944 startIndex!16) lt!610065)))

(declare-fun bs!40318 () Bool)

(assert (= bs!40318 d!149711))

(assert (=> bs!40318 m!1273163))

(declare-fun m!1273433 () Bool)

(assert (=> bs!40318 m!1273433))

(assert (=> b!1387932 d!149711))

(declare-fun d!149713 () Bool)

(declare-fun res!928652 () Bool)

(declare-fun e!786364 () Bool)

(assert (=> d!149713 (=> res!928652 e!786364)))

(assert (=> d!149713 (= res!928652 (= (select (arr!45817 a!2938) #b00000000000000000000000000000000) lt!609944))))

(assert (=> d!149713 (= (arrayContainsKey!0 a!2938 lt!609944 #b00000000000000000000000000000000) e!786364)))

(declare-fun b!1388169 () Bool)

(declare-fun e!786365 () Bool)

(assert (=> b!1388169 (= e!786364 e!786365)))

(declare-fun res!928653 () Bool)

(assert (=> b!1388169 (=> (not res!928653) (not e!786365))))

(assert (=> b!1388169 (= res!928653 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46369 a!2938)))))

(declare-fun b!1388170 () Bool)

(assert (=> b!1388170 (= e!786365 (arrayContainsKey!0 a!2938 lt!609944 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149713 (not res!928652)) b!1388169))

(assert (= (and b!1388169 res!928653) b!1388170))

(assert (=> d!149713 m!1273231))

(declare-fun m!1273435 () Bool)

(assert (=> b!1388170 m!1273435))

(assert (=> b!1387932 d!149713))

(assert (=> b!1387932 d!149631))

(declare-fun b!1388171 () Bool)

(declare-fun e!786367 () Bool)

(declare-fun e!786368 () Bool)

(assert (=> b!1388171 (= e!786367 e!786368)))

(declare-fun lt!610068 () (_ BitVec 64))

(assert (=> b!1388171 (= lt!610068 (select (arr!45817 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!610066 () Unit!46242)

(assert (=> b!1388171 (= lt!610066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610068 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1388171 (arrayContainsKey!0 a!2938 lt!610068 #b00000000000000000000000000000000)))

(declare-fun lt!610067 () Unit!46242)

(assert (=> b!1388171 (= lt!610067 lt!610066)))

(declare-fun res!928655 () Bool)

(assert (=> b!1388171 (= res!928655 (= (seekEntryOrOpen!0 (select (arr!45817 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1388171 (=> (not res!928655) (not e!786368))))

(declare-fun b!1388172 () Bool)

(declare-fun e!786366 () Bool)

(assert (=> b!1388172 (= e!786366 e!786367)))

(declare-fun c!129203 () Bool)

(assert (=> b!1388172 (= c!129203 (validKeyInArray!0 (select (arr!45817 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!66603 () Bool)

(declare-fun call!66606 () Bool)

(assert (=> bm!66603 (= call!66606 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149715 () Bool)

(declare-fun res!928654 () Bool)

(assert (=> d!149715 (=> res!928654 e!786366)))

(assert (=> d!149715 (= res!928654 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46369 a!2938)))))

(assert (=> d!149715 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987) e!786366)))

(declare-fun b!1388173 () Bool)

(assert (=> b!1388173 (= e!786367 call!66606)))

(declare-fun b!1388174 () Bool)

(assert (=> b!1388174 (= e!786368 call!66606)))

(assert (= (and d!149715 (not res!928654)) b!1388172))

(assert (= (and b!1388172 c!129203) b!1388171))

(assert (= (and b!1388172 (not c!129203)) b!1388173))

(assert (= (and b!1388171 res!928655) b!1388174))

(assert (= (or b!1388174 b!1388173) bm!66603))

(declare-fun m!1273437 () Bool)

(assert (=> b!1388171 m!1273437))

(declare-fun m!1273439 () Bool)

(assert (=> b!1388171 m!1273439))

(declare-fun m!1273441 () Bool)

(assert (=> b!1388171 m!1273441))

(assert (=> b!1388171 m!1273437))

(declare-fun m!1273443 () Bool)

(assert (=> b!1388171 m!1273443))

(assert (=> b!1388172 m!1273437))

(assert (=> b!1388172 m!1273437))

(declare-fun m!1273445 () Bool)

(assert (=> b!1388172 m!1273445))

(declare-fun m!1273447 () Bool)

(assert (=> bm!66603 m!1273447))

(assert (=> bm!66594 d!149715))

(declare-fun d!149717 () Bool)

(assert (=> d!149717 (= (validKeyInArray!0 (select (arr!45817 lt!609898) startIndex!16)) (and (not (= (select (arr!45817 lt!609898) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45817 lt!609898) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388010 d!149717))

(declare-fun b!1388175 () Bool)

(declare-fun e!786370 () Bool)

(declare-fun call!66607 () Bool)

(assert (=> b!1388175 (= e!786370 call!66607)))

(declare-fun b!1388176 () Bool)

(declare-fun e!786372 () Bool)

(assert (=> b!1388176 (= e!786372 (contains!9710 (ite c!129147 (Cons!32419 (select (arr!45817 a!2938) #b00000000000000000000000000000000) Nil!32420) Nil!32420) (select (arr!45817 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388177 () Bool)

(declare-fun e!786371 () Bool)

(declare-fun e!786369 () Bool)

(assert (=> b!1388177 (= e!786371 e!786369)))

(declare-fun res!928657 () Bool)

(assert (=> b!1388177 (=> (not res!928657) (not e!786369))))

(assert (=> b!1388177 (= res!928657 (not e!786372))))

(declare-fun res!928658 () Bool)

(assert (=> b!1388177 (=> (not res!928658) (not e!786372))))

(assert (=> b!1388177 (= res!928658 (validKeyInArray!0 (select (arr!45817 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1388178 () Bool)

(assert (=> b!1388178 (= e!786370 call!66607)))

(declare-fun c!129204 () Bool)

(declare-fun bm!66604 () Bool)

(assert (=> bm!66604 (= call!66607 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!129204 (Cons!32419 (select (arr!45817 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!129147 (Cons!32419 (select (arr!45817 a!2938) #b00000000000000000000000000000000) Nil!32420) Nil!32420)) (ite c!129147 (Cons!32419 (select (arr!45817 a!2938) #b00000000000000000000000000000000) Nil!32420) Nil!32420))))))

(declare-fun d!149719 () Bool)

(declare-fun res!928656 () Bool)

(assert (=> d!149719 (=> res!928656 e!786371)))

(assert (=> d!149719 (= res!928656 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46369 a!2938)))))

(assert (=> d!149719 (= (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129147 (Cons!32419 (select (arr!45817 a!2938) #b00000000000000000000000000000000) Nil!32420) Nil!32420)) e!786371)))

(declare-fun b!1388179 () Bool)

(assert (=> b!1388179 (= e!786369 e!786370)))

(assert (=> b!1388179 (= c!129204 (validKeyInArray!0 (select (arr!45817 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!149719 (not res!928656)) b!1388177))

(assert (= (and b!1388177 res!928658) b!1388176))

(assert (= (and b!1388177 res!928657) b!1388179))

(assert (= (and b!1388179 c!129204) b!1388175))

(assert (= (and b!1388179 (not c!129204)) b!1388178))

(assert (= (or b!1388175 b!1388178) bm!66604))

(assert (=> b!1388176 m!1273437))

(assert (=> b!1388176 m!1273437))

(declare-fun m!1273449 () Bool)

(assert (=> b!1388176 m!1273449))

(assert (=> b!1388177 m!1273437))

(assert (=> b!1388177 m!1273437))

(assert (=> b!1388177 m!1273445))

(assert (=> bm!66604 m!1273437))

(declare-fun m!1273451 () Bool)

(assert (=> bm!66604 m!1273451))

(assert (=> b!1388179 m!1273437))

(assert (=> b!1388179 m!1273437))

(assert (=> b!1388179 m!1273445))

(assert (=> bm!66592 d!149719))

(assert (=> b!1387933 d!149633))

(assert (=> b!1388014 d!149679))

(declare-fun d!149721 () Bool)

(assert (=> d!149721 (arrayContainsKey!0 lt!609898 lt!609992 #b00000000000000000000000000000000)))

(declare-fun lt!610069 () Unit!46242)

(assert (=> d!149721 (= lt!610069 (choose!13 lt!609898 lt!609992 startIndex!16))))

(assert (=> d!149721 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149721 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609898 lt!609992 startIndex!16) lt!610069)))

(declare-fun bs!40319 () Bool)

(assert (= bs!40319 d!149721))

(assert (=> bs!40319 m!1273243))

(declare-fun m!1273453 () Bool)

(assert (=> bs!40319 m!1273453))

(assert (=> b!1388009 d!149721))

(declare-fun d!149723 () Bool)

(declare-fun res!928659 () Bool)

(declare-fun e!786373 () Bool)

(assert (=> d!149723 (=> res!928659 e!786373)))

(assert (=> d!149723 (= res!928659 (= (select (arr!45817 lt!609898) #b00000000000000000000000000000000) lt!609992))))

(assert (=> d!149723 (= (arrayContainsKey!0 lt!609898 lt!609992 #b00000000000000000000000000000000) e!786373)))

(declare-fun b!1388180 () Bool)

(declare-fun e!786374 () Bool)

(assert (=> b!1388180 (= e!786373 e!786374)))

(declare-fun res!928660 () Bool)

(assert (=> b!1388180 (=> (not res!928660) (not e!786374))))

(assert (=> b!1388180 (= res!928660 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46369 lt!609898)))))

(declare-fun b!1388181 () Bool)

(assert (=> b!1388181 (= e!786374 (arrayContainsKey!0 lt!609898 lt!609992 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149723 (not res!928659)) b!1388180))

(assert (= (and b!1388180 res!928660) b!1388181))

(declare-fun m!1273455 () Bool)

(assert (=> d!149723 m!1273455))

(declare-fun m!1273457 () Bool)

(assert (=> b!1388181 m!1273457))

(assert (=> b!1388009 d!149723))

(declare-fun b!1388182 () Bool)

(declare-fun e!786377 () SeekEntryResult!10186)

(declare-fun lt!610070 () SeekEntryResult!10186)

(assert (=> b!1388182 (= e!786377 (MissingZero!10186 (index!43117 lt!610070)))))

(declare-fun b!1388183 () Bool)

(declare-fun e!786376 () SeekEntryResult!10186)

(declare-fun e!786375 () SeekEntryResult!10186)

(assert (=> b!1388183 (= e!786376 e!786375)))

(declare-fun lt!610071 () (_ BitVec 64))

(assert (=> b!1388183 (= lt!610071 (select (arr!45817 lt!609898) (index!43117 lt!610070)))))

(declare-fun c!129207 () Bool)

(assert (=> b!1388183 (= c!129207 (= lt!610071 (select (arr!45817 lt!609898) startIndex!16)))))

(declare-fun b!1388184 () Bool)

(assert (=> b!1388184 (= e!786377 (seekKeyOrZeroReturnVacant!0 (x!124729 lt!610070) (index!43117 lt!610070) (index!43117 lt!610070) (select (arr!45817 lt!609898) startIndex!16) lt!609898 mask!2987))))

(declare-fun b!1388185 () Bool)

(assert (=> b!1388185 (= e!786376 Undefined!10186)))

(declare-fun b!1388186 () Bool)

(assert (=> b!1388186 (= e!786375 (Found!10186 (index!43117 lt!610070)))))

(declare-fun d!149725 () Bool)

(declare-fun lt!610072 () SeekEntryResult!10186)

(assert (=> d!149725 (and (or ((_ is Undefined!10186) lt!610072) (not ((_ is Found!10186) lt!610072)) (and (bvsge (index!43116 lt!610072) #b00000000000000000000000000000000) (bvslt (index!43116 lt!610072) (size!46369 lt!609898)))) (or ((_ is Undefined!10186) lt!610072) ((_ is Found!10186) lt!610072) (not ((_ is MissingZero!10186) lt!610072)) (and (bvsge (index!43115 lt!610072) #b00000000000000000000000000000000) (bvslt (index!43115 lt!610072) (size!46369 lt!609898)))) (or ((_ is Undefined!10186) lt!610072) ((_ is Found!10186) lt!610072) ((_ is MissingZero!10186) lt!610072) (not ((_ is MissingVacant!10186) lt!610072)) (and (bvsge (index!43118 lt!610072) #b00000000000000000000000000000000) (bvslt (index!43118 lt!610072) (size!46369 lt!609898)))) (or ((_ is Undefined!10186) lt!610072) (ite ((_ is Found!10186) lt!610072) (= (select (arr!45817 lt!609898) (index!43116 lt!610072)) (select (arr!45817 lt!609898) startIndex!16)) (ite ((_ is MissingZero!10186) lt!610072) (= (select (arr!45817 lt!609898) (index!43115 lt!610072)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10186) lt!610072) (= (select (arr!45817 lt!609898) (index!43118 lt!610072)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!149725 (= lt!610072 e!786376)))

(declare-fun c!129205 () Bool)

(assert (=> d!149725 (= c!129205 (and ((_ is Intermediate!10186) lt!610070) (undefined!10998 lt!610070)))))

(assert (=> d!149725 (= lt!610070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45817 lt!609898) startIndex!16) mask!2987) (select (arr!45817 lt!609898) startIndex!16) lt!609898 mask!2987))))

(assert (=> d!149725 (validMask!0 mask!2987)))

(assert (=> d!149725 (= (seekEntryOrOpen!0 (select (arr!45817 lt!609898) startIndex!16) lt!609898 mask!2987) lt!610072)))

(declare-fun b!1388187 () Bool)

(declare-fun c!129206 () Bool)

(assert (=> b!1388187 (= c!129206 (= lt!610071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1388187 (= e!786375 e!786377)))

(assert (= (and d!149725 c!129205) b!1388185))

(assert (= (and d!149725 (not c!129205)) b!1388183))

(assert (= (and b!1388183 c!129207) b!1388186))

(assert (= (and b!1388183 (not c!129207)) b!1388187))

(assert (= (and b!1388187 c!129206) b!1388182))

(assert (= (and b!1388187 (not c!129206)) b!1388184))

(declare-fun m!1273459 () Bool)

(assert (=> b!1388183 m!1273459))

(assert (=> b!1388184 m!1273239))

(declare-fun m!1273461 () Bool)

(assert (=> b!1388184 m!1273461))

(assert (=> d!149725 m!1273239))

(declare-fun m!1273463 () Bool)

(assert (=> d!149725 m!1273463))

(declare-fun m!1273465 () Bool)

(assert (=> d!149725 m!1273465))

(declare-fun m!1273467 () Bool)

(assert (=> d!149725 m!1273467))

(assert (=> d!149725 m!1273041))

(declare-fun m!1273469 () Bool)

(assert (=> d!149725 m!1273469))

(assert (=> d!149725 m!1273463))

(assert (=> d!149725 m!1273239))

(declare-fun m!1273471 () Bool)

(assert (=> d!149725 m!1273471))

(assert (=> b!1388009 d!149725))

(check-sat (not b!1388143) (not d!149721) (not b!1388179) (not b!1388100) (not d!149699) (not bm!66604) (not b!1388153) (not b!1388165) (not bm!66602) (not b!1388139) (not b!1388129) (not b!1388181) (not b!1388170) (not d!149701) (not b!1388162) (not d!149691) (not d!149709) (not d!149711) (not bm!66603) (not b!1388177) (not b!1388171) (not b!1388154) (not b!1388123) (not d!149705) (not d!149685) (not b!1388144) (not d!149697) (not d!149725) (not b!1388176) (not d!149689) (not b!1388149) (not bm!66601) (not d!149681) (not b!1388172) (not b!1388184) (not b!1388109) (not d!149687))
(check-sat)
