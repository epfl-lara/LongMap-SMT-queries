; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67902 () Bool)

(assert start!67902)

(declare-fun b!789987 () Bool)

(declare-fun e!439071 () Bool)

(assert (=> b!789987 (= e!439071 true)))

(declare-datatypes ((SeekEntryResult!8126 0))(
  ( (MissingZero!8126 (index!34872 (_ BitVec 32))) (Found!8126 (index!34873 (_ BitVec 32))) (Intermediate!8126 (undefined!8938 Bool) (index!34874 (_ BitVec 32)) (x!65811 (_ BitVec 32))) (Undefined!8126) (MissingVacant!8126 (index!34875 (_ BitVec 32))) )
))
(declare-fun lt!352593 () SeekEntryResult!8126)

(declare-fun lt!352597 () SeekEntryResult!8126)

(assert (=> b!789987 (= lt!352593 lt!352597)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42879 0))(
  ( (array!42880 (arr!20526 (Array (_ BitVec 32) (_ BitVec 64))) (size!20947 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42879)

(declare-datatypes ((Unit!27392 0))(
  ( (Unit!27393) )
))
(declare-fun lt!352602 () Unit!27392)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42879 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27392)

(assert (=> b!789987 (= lt!352602 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!789988 () Bool)

(declare-fun e!439074 () Bool)

(declare-fun e!439081 () Bool)

(assert (=> b!789988 (= e!439074 e!439081)))

(declare-fun res!535168 () Bool)

(assert (=> b!789988 (=> (not res!535168) (not e!439081))))

(declare-fun lt!352604 () SeekEntryResult!8126)

(declare-fun lt!352598 () SeekEntryResult!8126)

(assert (=> b!789988 (= res!535168 (= lt!352604 lt!352598))))

(declare-fun lt!352606 () array!42879)

(declare-fun lt!352594 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42879 (_ BitVec 32)) SeekEntryResult!8126)

(assert (=> b!789988 (= lt!352598 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352594 lt!352606 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789988 (= lt!352604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352594 mask!3328) lt!352594 lt!352606 mask!3328))))

(assert (=> b!789988 (= lt!352594 (select (store (arr!20526 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!789988 (= lt!352606 (array!42880 (store (arr!20526 a!3186) i!1173 k!2102) (size!20947 a!3186)))))

(declare-fun b!789989 () Bool)

(declare-fun e!439076 () Bool)

(assert (=> b!789989 (= e!439081 (not e!439076))))

(declare-fun res!535171 () Bool)

(assert (=> b!789989 (=> res!535171 e!439076)))

(assert (=> b!789989 (= res!535171 (or (not (is-Intermediate!8126 lt!352598)) (bvslt x!1131 (x!65811 lt!352598)) (not (= x!1131 (x!65811 lt!352598))) (not (= index!1321 (index!34874 lt!352598)))))))

(declare-fun e!439079 () Bool)

(assert (=> b!789989 e!439079))

(declare-fun res!535175 () Bool)

(assert (=> b!789989 (=> (not res!535175) (not e!439079))))

(declare-fun lt!352607 () SeekEntryResult!8126)

(declare-fun lt!352603 () SeekEntryResult!8126)

(assert (=> b!789989 (= res!535175 (= lt!352607 lt!352603))))

(assert (=> b!789989 (= lt!352603 (Found!8126 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42879 (_ BitVec 32)) SeekEntryResult!8126)

(assert (=> b!789989 (= lt!352607 (seekEntryOrOpen!0 (select (arr!20526 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42879 (_ BitVec 32)) Bool)

(assert (=> b!789989 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352596 () Unit!27392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27392)

(assert (=> b!789989 (= lt!352596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789990 () Bool)

(declare-fun e!439077 () Unit!27392)

(declare-fun Unit!27394 () Unit!27392)

(assert (=> b!789990 (= e!439077 Unit!27394)))

(declare-fun b!789991 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42879 (_ BitVec 32)) SeekEntryResult!8126)

(assert (=> b!789991 (= e!439079 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20526 a!3186) j!159) a!3186 mask!3328) lt!352603))))

(declare-fun b!789992 () Bool)

(declare-fun e!439082 () Bool)

(assert (=> b!789992 (= e!439076 e!439082)))

(declare-fun res!535170 () Bool)

(assert (=> b!789992 (=> res!535170 e!439082)))

(assert (=> b!789992 (= res!535170 (not (= lt!352597 lt!352603)))))

(assert (=> b!789992 (= lt!352597 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20526 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789993 () Bool)

(declare-fun res!535177 () Bool)

(declare-fun e!439075 () Bool)

(assert (=> b!789993 (=> (not res!535177) (not e!439075))))

(declare-datatypes ((List!14528 0))(
  ( (Nil!14525) (Cons!14524 (h!15650 (_ BitVec 64)) (t!20843 List!14528)) )
))
(declare-fun arrayNoDuplicates!0 (array!42879 (_ BitVec 32) List!14528) Bool)

(assert (=> b!789993 (= res!535177 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14525))))

(declare-fun b!789994 () Bool)

(declare-fun Unit!27395 () Unit!27392)

(assert (=> b!789994 (= e!439077 Unit!27395)))

(assert (=> b!789994 false))

(declare-fun b!789995 () Bool)

(declare-fun res!535181 () Bool)

(assert (=> b!789995 (=> (not res!535181) (not e!439075))))

(assert (=> b!789995 (= res!535181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789996 () Bool)

(assert (=> b!789996 (= e!439075 e!439074)))

(declare-fun res!535179 () Bool)

(assert (=> b!789996 (=> (not res!535179) (not e!439074))))

(declare-fun lt!352600 () SeekEntryResult!8126)

(assert (=> b!789996 (= res!535179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20526 a!3186) j!159) mask!3328) (select (arr!20526 a!3186) j!159) a!3186 mask!3328) lt!352600))))

(assert (=> b!789996 (= lt!352600 (Intermediate!8126 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789997 () Bool)

(declare-fun res!535174 () Bool)

(declare-fun e!439072 () Bool)

(assert (=> b!789997 (=> (not res!535174) (not e!439072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789997 (= res!535174 (validKeyInArray!0 (select (arr!20526 a!3186) j!159)))))

(declare-fun b!789998 () Bool)

(declare-fun res!535180 () Bool)

(assert (=> b!789998 (=> (not res!535180) (not e!439075))))

(assert (=> b!789998 (= res!535180 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20947 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20947 a!3186))))))

(declare-fun b!789999 () Bool)

(declare-fun res!535169 () Bool)

(assert (=> b!789999 (=> (not res!535169) (not e!439072))))

(assert (=> b!789999 (= res!535169 (validKeyInArray!0 k!2102))))

(declare-fun b!790000 () Bool)

(declare-fun e!439080 () Bool)

(assert (=> b!790000 (= e!439080 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20526 a!3186) j!159) a!3186 mask!3328) (Found!8126 j!159)))))

(declare-fun b!790001 () Bool)

(declare-fun res!535183 () Bool)

(assert (=> b!790001 (=> (not res!535183) (not e!439072))))

(declare-fun arrayContainsKey!0 (array!42879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790001 (= res!535183 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790002 () Bool)

(declare-fun res!535167 () Bool)

(assert (=> b!790002 (=> (not res!535167) (not e!439074))))

(assert (=> b!790002 (= res!535167 e!439080)))

(declare-fun c!87820 () Bool)

(assert (=> b!790002 (= c!87820 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790003 () Bool)

(assert (=> b!790003 (= e!439072 e!439075)))

(declare-fun res!535176 () Bool)

(assert (=> b!790003 (=> (not res!535176) (not e!439075))))

(declare-fun lt!352595 () SeekEntryResult!8126)

(assert (=> b!790003 (= res!535176 (or (= lt!352595 (MissingZero!8126 i!1173)) (= lt!352595 (MissingVacant!8126 i!1173))))))

(assert (=> b!790003 (= lt!352595 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!790004 () Bool)

(declare-fun res!535178 () Bool)

(assert (=> b!790004 (=> (not res!535178) (not e!439074))))

(assert (=> b!790004 (= res!535178 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20526 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790005 () Bool)

(declare-fun e!439073 () Bool)

(assert (=> b!790005 (= e!439082 e!439073)))

(declare-fun res!535184 () Bool)

(assert (=> b!790005 (=> res!535184 e!439073)))

(declare-fun lt!352599 () (_ BitVec 64))

(assert (=> b!790005 (= res!535184 (= lt!352599 lt!352594))))

(assert (=> b!790005 (= lt!352599 (select (store (arr!20526 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!790006 () Bool)

(assert (=> b!790006 (= e!439080 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20526 a!3186) j!159) a!3186 mask!3328) lt!352600))))

(declare-fun b!790007 () Bool)

(assert (=> b!790007 (= e!439073 e!439071)))

(declare-fun res!535173 () Bool)

(assert (=> b!790007 (=> res!535173 e!439071)))

(assert (=> b!790007 (= res!535173 (or (not (= (select (arr!20526 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352605 () SeekEntryResult!8126)

(assert (=> b!790007 (and (= lt!352605 lt!352593) (= lt!352607 lt!352597))))

(assert (=> b!790007 (= lt!352593 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352594 lt!352606 mask!3328))))

(assert (=> b!790007 (= lt!352605 (seekEntryOrOpen!0 lt!352594 lt!352606 mask!3328))))

(assert (=> b!790007 (= lt!352599 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352601 () Unit!27392)

(assert (=> b!790007 (= lt!352601 e!439077)))

(declare-fun c!87819 () Bool)

(assert (=> b!790007 (= c!87819 (= lt!352599 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!535172 () Bool)

(assert (=> start!67902 (=> (not res!535172) (not e!439072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67902 (= res!535172 (validMask!0 mask!3328))))

(assert (=> start!67902 e!439072))

(assert (=> start!67902 true))

(declare-fun array_inv!16322 (array!42879) Bool)

(assert (=> start!67902 (array_inv!16322 a!3186)))

(declare-fun b!790008 () Bool)

(declare-fun res!535182 () Bool)

(assert (=> b!790008 (=> (not res!535182) (not e!439072))))

(assert (=> b!790008 (= res!535182 (and (= (size!20947 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20947 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20947 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67902 res!535172) b!790008))

(assert (= (and b!790008 res!535182) b!789997))

(assert (= (and b!789997 res!535174) b!789999))

(assert (= (and b!789999 res!535169) b!790001))

(assert (= (and b!790001 res!535183) b!790003))

(assert (= (and b!790003 res!535176) b!789995))

(assert (= (and b!789995 res!535181) b!789993))

(assert (= (and b!789993 res!535177) b!789998))

(assert (= (and b!789998 res!535180) b!789996))

(assert (= (and b!789996 res!535179) b!790004))

(assert (= (and b!790004 res!535178) b!790002))

(assert (= (and b!790002 c!87820) b!790006))

(assert (= (and b!790002 (not c!87820)) b!790000))

(assert (= (and b!790002 res!535167) b!789988))

(assert (= (and b!789988 res!535168) b!789989))

(assert (= (and b!789989 res!535175) b!789991))

(assert (= (and b!789989 (not res!535171)) b!789992))

(assert (= (and b!789992 (not res!535170)) b!790005))

(assert (= (and b!790005 (not res!535184)) b!790007))

(assert (= (and b!790007 c!87819) b!789994))

(assert (= (and b!790007 (not c!87819)) b!789990))

(assert (= (and b!790007 (not res!535173)) b!789987))

(declare-fun m!730973 () Bool)

(assert (=> b!790000 m!730973))

(assert (=> b!790000 m!730973))

(declare-fun m!730975 () Bool)

(assert (=> b!790000 m!730975))

(declare-fun m!730977 () Bool)

(assert (=> b!790005 m!730977))

(declare-fun m!730979 () Bool)

(assert (=> b!790005 m!730979))

(assert (=> b!789991 m!730973))

(assert (=> b!789991 m!730973))

(declare-fun m!730981 () Bool)

(assert (=> b!789991 m!730981))

(declare-fun m!730983 () Bool)

(assert (=> b!790001 m!730983))

(declare-fun m!730985 () Bool)

(assert (=> b!790007 m!730985))

(declare-fun m!730987 () Bool)

(assert (=> b!790007 m!730987))

(declare-fun m!730989 () Bool)

(assert (=> b!790007 m!730989))

(declare-fun m!730991 () Bool)

(assert (=> b!789988 m!730991))

(declare-fun m!730993 () Bool)

(assert (=> b!789988 m!730993))

(assert (=> b!789988 m!730991))

(declare-fun m!730995 () Bool)

(assert (=> b!789988 m!730995))

(assert (=> b!789988 m!730977))

(declare-fun m!730997 () Bool)

(assert (=> b!789988 m!730997))

(declare-fun m!730999 () Bool)

(assert (=> b!789999 m!730999))

(declare-fun m!731001 () Bool)

(assert (=> b!789995 m!731001))

(declare-fun m!731003 () Bool)

(assert (=> b!789993 m!731003))

(assert (=> b!789992 m!730973))

(assert (=> b!789992 m!730973))

(assert (=> b!789992 m!730975))

(assert (=> b!789989 m!730973))

(assert (=> b!789989 m!730973))

(declare-fun m!731005 () Bool)

(assert (=> b!789989 m!731005))

(declare-fun m!731007 () Bool)

(assert (=> b!789989 m!731007))

(declare-fun m!731009 () Bool)

(assert (=> b!789989 m!731009))

(assert (=> b!789997 m!730973))

(assert (=> b!789997 m!730973))

(declare-fun m!731011 () Bool)

(assert (=> b!789997 m!731011))

(declare-fun m!731013 () Bool)

(assert (=> b!789987 m!731013))

(declare-fun m!731015 () Bool)

(assert (=> start!67902 m!731015))

(declare-fun m!731017 () Bool)

(assert (=> start!67902 m!731017))

(assert (=> b!790006 m!730973))

(assert (=> b!790006 m!730973))

(declare-fun m!731019 () Bool)

(assert (=> b!790006 m!731019))

(declare-fun m!731021 () Bool)

(assert (=> b!790004 m!731021))

(assert (=> b!789996 m!730973))

(assert (=> b!789996 m!730973))

(declare-fun m!731023 () Bool)

(assert (=> b!789996 m!731023))

(assert (=> b!789996 m!731023))

(assert (=> b!789996 m!730973))

(declare-fun m!731025 () Bool)

(assert (=> b!789996 m!731025))

(declare-fun m!731027 () Bool)

(assert (=> b!790003 m!731027))

(push 1)

