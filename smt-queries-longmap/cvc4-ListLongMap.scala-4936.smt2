; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67996 () Bool)

(assert start!67996)

(declare-fun b!791198 () Bool)

(declare-fun res!535982 () Bool)

(declare-fun e!439728 () Bool)

(assert (=> b!791198 (=> (not res!535982) (not e!439728))))

(declare-fun e!439727 () Bool)

(assert (=> b!791198 (= res!535982 e!439727)))

(declare-fun c!88024 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!791198 (= c!88024 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791199 () Bool)

(declare-fun e!439729 () Bool)

(assert (=> b!791199 (= e!439728 e!439729)))

(declare-fun res!535974 () Bool)

(assert (=> b!791199 (=> (not res!535974) (not e!439729))))

(declare-datatypes ((array!42910 0))(
  ( (array!42911 (arr!20540 (Array (_ BitVec 32) (_ BitVec 64))) (size!20961 (_ BitVec 32))) )
))
(declare-fun lt!353175 () array!42910)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!353177 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8140 0))(
  ( (MissingZero!8140 (index!34928 (_ BitVec 32))) (Found!8140 (index!34929 (_ BitVec 32))) (Intermediate!8140 (undefined!8952 Bool) (index!34930 (_ BitVec 32)) (x!65866 (_ BitVec 32))) (Undefined!8140) (MissingVacant!8140 (index!34931 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42910 (_ BitVec 32)) SeekEntryResult!8140)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791199 (= res!535974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353177 mask!3328) lt!353177 lt!353175 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353177 lt!353175 mask!3328)))))

(declare-fun a!3186 () array!42910)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!791199 (= lt!353177 (select (store (arr!20540 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!791199 (= lt!353175 (array!42911 (store (arr!20540 a!3186) i!1173 k!2102) (size!20961 a!3186)))))

(declare-fun b!791200 () Bool)

(declare-fun e!439730 () Bool)

(declare-fun e!439723 () Bool)

(assert (=> b!791200 (= e!439730 e!439723)))

(declare-fun res!535980 () Bool)

(assert (=> b!791200 (=> (not res!535980) (not e!439723))))

(declare-fun lt!353173 () SeekEntryResult!8140)

(assert (=> b!791200 (= res!535980 (or (= lt!353173 (MissingZero!8140 i!1173)) (= lt!353173 (MissingVacant!8140 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42910 (_ BitVec 32)) SeekEntryResult!8140)

(assert (=> b!791200 (= lt!353173 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!439726 () Bool)

(declare-fun lt!353172 () SeekEntryResult!8140)

(declare-fun b!791201 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42910 (_ BitVec 32)) SeekEntryResult!8140)

(assert (=> b!791201 (= e!439726 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20540 a!3186) j!159) a!3186 mask!3328) lt!353172))))

(declare-fun b!791202 () Bool)

(assert (=> b!791202 (= e!439729 (not true))))

(declare-fun e!439724 () Bool)

(assert (=> b!791202 e!439724))

(declare-fun res!535984 () Bool)

(assert (=> b!791202 (=> (not res!535984) (not e!439724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42910 (_ BitVec 32)) Bool)

(assert (=> b!791202 (= res!535984 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27432 0))(
  ( (Unit!27433) )
))
(declare-fun lt!353174 () Unit!27432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27432)

(assert (=> b!791202 (= lt!353174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791203 () Bool)

(assert (=> b!791203 (= e!439724 e!439726)))

(declare-fun res!535976 () Bool)

(assert (=> b!791203 (=> (not res!535976) (not e!439726))))

(assert (=> b!791203 (= res!535976 (= (seekEntryOrOpen!0 (select (arr!20540 a!3186) j!159) a!3186 mask!3328) lt!353172))))

(assert (=> b!791203 (= lt!353172 (Found!8140 j!159))))

(declare-fun b!791204 () Bool)

(declare-fun res!535985 () Bool)

(assert (=> b!791204 (=> (not res!535985) (not e!439723))))

(assert (=> b!791204 (= res!535985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!535983 () Bool)

(assert (=> start!67996 (=> (not res!535983) (not e!439730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67996 (= res!535983 (validMask!0 mask!3328))))

(assert (=> start!67996 e!439730))

(assert (=> start!67996 true))

(declare-fun array_inv!16336 (array!42910) Bool)

(assert (=> start!67996 (array_inv!16336 a!3186)))

(declare-fun b!791205 () Bool)

(assert (=> b!791205 (= e!439727 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20540 a!3186) j!159) a!3186 mask!3328) (Found!8140 j!159)))))

(declare-fun b!791206 () Bool)

(assert (=> b!791206 (= e!439723 e!439728)))

(declare-fun res!535971 () Bool)

(assert (=> b!791206 (=> (not res!535971) (not e!439728))))

(declare-fun lt!353176 () SeekEntryResult!8140)

(assert (=> b!791206 (= res!535971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20540 a!3186) j!159) mask!3328) (select (arr!20540 a!3186) j!159) a!3186 mask!3328) lt!353176))))

(assert (=> b!791206 (= lt!353176 (Intermediate!8140 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791207 () Bool)

(declare-fun res!535972 () Bool)

(assert (=> b!791207 (=> (not res!535972) (not e!439723))))

(declare-datatypes ((List!14542 0))(
  ( (Nil!14539) (Cons!14538 (h!15667 (_ BitVec 64)) (t!20857 List!14542)) )
))
(declare-fun arrayNoDuplicates!0 (array!42910 (_ BitVec 32) List!14542) Bool)

(assert (=> b!791207 (= res!535972 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14539))))

(declare-fun b!791208 () Bool)

(assert (=> b!791208 (= e!439727 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20540 a!3186) j!159) a!3186 mask!3328) lt!353176))))

(declare-fun b!791209 () Bool)

(declare-fun res!535981 () Bool)

(assert (=> b!791209 (=> (not res!535981) (not e!439723))))

(assert (=> b!791209 (= res!535981 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20961 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20961 a!3186))))))

(declare-fun b!791210 () Bool)

(declare-fun res!535978 () Bool)

(assert (=> b!791210 (=> (not res!535978) (not e!439730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791210 (= res!535978 (validKeyInArray!0 k!2102))))

(declare-fun b!791211 () Bool)

(declare-fun res!535975 () Bool)

(assert (=> b!791211 (=> (not res!535975) (not e!439730))))

(assert (=> b!791211 (= res!535975 (and (= (size!20961 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20961 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20961 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791212 () Bool)

(declare-fun res!535977 () Bool)

(assert (=> b!791212 (=> (not res!535977) (not e!439730))))

(assert (=> b!791212 (= res!535977 (validKeyInArray!0 (select (arr!20540 a!3186) j!159)))))

(declare-fun b!791213 () Bool)

(declare-fun res!535979 () Bool)

(assert (=> b!791213 (=> (not res!535979) (not e!439728))))

(assert (=> b!791213 (= res!535979 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20540 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791214 () Bool)

(declare-fun res!535973 () Bool)

(assert (=> b!791214 (=> (not res!535973) (not e!439730))))

(declare-fun arrayContainsKey!0 (array!42910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791214 (= res!535973 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67996 res!535983) b!791211))

(assert (= (and b!791211 res!535975) b!791212))

(assert (= (and b!791212 res!535977) b!791210))

(assert (= (and b!791210 res!535978) b!791214))

(assert (= (and b!791214 res!535973) b!791200))

(assert (= (and b!791200 res!535980) b!791204))

(assert (= (and b!791204 res!535985) b!791207))

(assert (= (and b!791207 res!535972) b!791209))

(assert (= (and b!791209 res!535981) b!791206))

(assert (= (and b!791206 res!535971) b!791213))

(assert (= (and b!791213 res!535979) b!791198))

(assert (= (and b!791198 c!88024) b!791208))

(assert (= (and b!791198 (not c!88024)) b!791205))

(assert (= (and b!791198 res!535982) b!791199))

(assert (= (and b!791199 res!535974) b!791202))

(assert (= (and b!791202 res!535984) b!791203))

(assert (= (and b!791203 res!535976) b!791201))

(declare-fun m!731959 () Bool)

(assert (=> start!67996 m!731959))

(declare-fun m!731961 () Bool)

(assert (=> start!67996 m!731961))

(declare-fun m!731963 () Bool)

(assert (=> b!791205 m!731963))

(assert (=> b!791205 m!731963))

(declare-fun m!731965 () Bool)

(assert (=> b!791205 m!731965))

(declare-fun m!731967 () Bool)

(assert (=> b!791199 m!731967))

(declare-fun m!731969 () Bool)

(assert (=> b!791199 m!731969))

(declare-fun m!731971 () Bool)

(assert (=> b!791199 m!731971))

(declare-fun m!731973 () Bool)

(assert (=> b!791199 m!731973))

(assert (=> b!791199 m!731969))

(declare-fun m!731975 () Bool)

(assert (=> b!791199 m!731975))

(assert (=> b!791201 m!731963))

(assert (=> b!791201 m!731963))

(declare-fun m!731977 () Bool)

(assert (=> b!791201 m!731977))

(assert (=> b!791208 m!731963))

(assert (=> b!791208 m!731963))

(declare-fun m!731979 () Bool)

(assert (=> b!791208 m!731979))

(declare-fun m!731981 () Bool)

(assert (=> b!791214 m!731981))

(declare-fun m!731983 () Bool)

(assert (=> b!791207 m!731983))

(assert (=> b!791212 m!731963))

(assert (=> b!791212 m!731963))

(declare-fun m!731985 () Bool)

(assert (=> b!791212 m!731985))

(assert (=> b!791203 m!731963))

(assert (=> b!791203 m!731963))

(declare-fun m!731987 () Bool)

(assert (=> b!791203 m!731987))

(declare-fun m!731989 () Bool)

(assert (=> b!791200 m!731989))

(declare-fun m!731991 () Bool)

(assert (=> b!791213 m!731991))

(declare-fun m!731993 () Bool)

(assert (=> b!791202 m!731993))

(declare-fun m!731995 () Bool)

(assert (=> b!791202 m!731995))

(assert (=> b!791206 m!731963))

(assert (=> b!791206 m!731963))

(declare-fun m!731997 () Bool)

(assert (=> b!791206 m!731997))

(assert (=> b!791206 m!731997))

(assert (=> b!791206 m!731963))

(declare-fun m!731999 () Bool)

(assert (=> b!791206 m!731999))

(declare-fun m!732001 () Bool)

(assert (=> b!791210 m!732001))

(declare-fun m!732003 () Bool)

(assert (=> b!791204 m!732003))

(push 1)

