; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67724 () Bool)

(assert start!67724)

(declare-fun b!786199 () Bool)

(declare-fun e!437032 () Bool)

(declare-fun e!437037 () Bool)

(assert (=> b!786199 (= e!437032 e!437037)))

(declare-fun res!532397 () Bool)

(assert (=> b!786199 (=> (not res!532397) (not e!437037))))

(declare-datatypes ((array!42783 0))(
  ( (array!42784 (arr!20480 (Array (_ BitVec 32) (_ BitVec 64))) (size!20901 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42783)

(declare-datatypes ((SeekEntryResult!8077 0))(
  ( (MissingZero!8077 (index!34676 (_ BitVec 32))) (Found!8077 (index!34677 (_ BitVec 32))) (Intermediate!8077 (undefined!8889 Bool) (index!34678 (_ BitVec 32)) (x!65628 (_ BitVec 32))) (Undefined!8077) (MissingVacant!8077 (index!34679 (_ BitVec 32))) )
))
(declare-fun lt!350502 () SeekEntryResult!8077)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42783 (_ BitVec 32)) SeekEntryResult!8077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786199 (= res!532397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20480 a!3186) j!159) mask!3328) (select (arr!20480 a!3186) j!159) a!3186 mask!3328) lt!350502))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786199 (= lt!350502 (Intermediate!8077 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786200 () Bool)

(declare-fun res!532400 () Bool)

(assert (=> b!786200 (=> (not res!532400) (not e!437032))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!786200 (= res!532400 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20901 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20901 a!3186))))))

(declare-fun b!786201 () Bool)

(declare-fun res!532387 () Bool)

(declare-fun e!437035 () Bool)

(assert (=> b!786201 (=> (not res!532387) (not e!437035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786201 (= res!532387 (validKeyInArray!0 (select (arr!20480 a!3186) j!159)))))

(declare-fun b!786202 () Bool)

(declare-fun res!532394 () Bool)

(assert (=> b!786202 (=> (not res!532394) (not e!437032))))

(declare-datatypes ((List!14521 0))(
  ( (Nil!14518) (Cons!14517 (h!15640 (_ BitVec 64)) (t!20827 List!14521)) )
))
(declare-fun arrayNoDuplicates!0 (array!42783 (_ BitVec 32) List!14521) Bool)

(assert (=> b!786202 (= res!532394 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14518))))

(declare-fun b!786203 () Bool)

(assert (=> b!786203 (= e!437035 e!437032)))

(declare-fun res!532404 () Bool)

(assert (=> b!786203 (=> (not res!532404) (not e!437032))))

(declare-fun lt!350500 () SeekEntryResult!8077)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786203 (= res!532404 (or (= lt!350500 (MissingZero!8077 i!1173)) (= lt!350500 (MissingVacant!8077 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42783 (_ BitVec 32)) SeekEntryResult!8077)

(assert (=> b!786203 (= lt!350500 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786204 () Bool)

(declare-fun e!437033 () Bool)

(assert (=> b!786204 (= e!437037 e!437033)))

(declare-fun res!532403 () Bool)

(assert (=> b!786204 (=> (not res!532403) (not e!437033))))

(declare-fun lt!350499 () SeekEntryResult!8077)

(declare-fun lt!350498 () SeekEntryResult!8077)

(assert (=> b!786204 (= res!532403 (= lt!350499 lt!350498))))

(declare-fun lt!350504 () array!42783)

(declare-fun lt!350496 () (_ BitVec 64))

(assert (=> b!786204 (= lt!350498 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350496 lt!350504 mask!3328))))

(assert (=> b!786204 (= lt!350499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350496 mask!3328) lt!350496 lt!350504 mask!3328))))

(assert (=> b!786204 (= lt!350496 (select (store (arr!20480 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786204 (= lt!350504 (array!42784 (store (arr!20480 a!3186) i!1173 k0!2102) (size!20901 a!3186)))))

(declare-fun b!786205 () Bool)

(declare-fun e!437038 () Bool)

(declare-fun e!437029 () Bool)

(assert (=> b!786205 (= e!437038 e!437029)))

(declare-fun res!532392 () Bool)

(assert (=> b!786205 (=> res!532392 e!437029)))

(declare-fun lt!350495 () SeekEntryResult!8077)

(declare-fun lt!350501 () SeekEntryResult!8077)

(assert (=> b!786205 (= res!532392 (not (= lt!350495 lt!350501)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42783 (_ BitVec 32)) SeekEntryResult!8077)

(assert (=> b!786205 (= lt!350495 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20480 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!532395 () Bool)

(assert (=> start!67724 (=> (not res!532395) (not e!437035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67724 (= res!532395 (validMask!0 mask!3328))))

(assert (=> start!67724 e!437035))

(assert (=> start!67724 true))

(declare-fun array_inv!16363 (array!42783) Bool)

(assert (=> start!67724 (array_inv!16363 a!3186)))

(declare-fun b!786206 () Bool)

(declare-fun e!437030 () Bool)

(assert (=> b!786206 (= e!437030 true)))

(declare-fun e!437036 () Bool)

(assert (=> b!786206 e!437036))

(declare-fun res!532401 () Bool)

(assert (=> b!786206 (=> (not res!532401) (not e!437036))))

(declare-fun lt!350494 () (_ BitVec 64))

(assert (=> b!786206 (= res!532401 (= lt!350494 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27176 0))(
  ( (Unit!27177) )
))
(declare-fun lt!350503 () Unit!27176)

(declare-fun e!437027 () Unit!27176)

(assert (=> b!786206 (= lt!350503 e!437027)))

(declare-fun c!87314 () Bool)

(assert (=> b!786206 (= c!87314 (= lt!350494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786207 () Bool)

(declare-fun e!437031 () Bool)

(assert (=> b!786207 (= e!437031 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20480 a!3186) j!159) a!3186 mask!3328) lt!350501))))

(declare-fun b!786208 () Bool)

(declare-fun res!532398 () Bool)

(assert (=> b!786208 (=> (not res!532398) (not e!437037))))

(declare-fun e!437028 () Bool)

(assert (=> b!786208 (= res!532398 e!437028)))

(declare-fun c!87315 () Bool)

(assert (=> b!786208 (= c!87315 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786209 () Bool)

(assert (=> b!786209 (= e!437033 (not e!437038))))

(declare-fun res!532402 () Bool)

(assert (=> b!786209 (=> res!532402 e!437038)))

(get-info :version)

(assert (=> b!786209 (= res!532402 (or (not ((_ is Intermediate!8077) lt!350498)) (bvslt x!1131 (x!65628 lt!350498)) (not (= x!1131 (x!65628 lt!350498))) (not (= index!1321 (index!34678 lt!350498)))))))

(assert (=> b!786209 e!437031))

(declare-fun res!532396 () Bool)

(assert (=> b!786209 (=> (not res!532396) (not e!437031))))

(declare-fun lt!350493 () SeekEntryResult!8077)

(assert (=> b!786209 (= res!532396 (= lt!350493 lt!350501))))

(assert (=> b!786209 (= lt!350501 (Found!8077 j!159))))

(assert (=> b!786209 (= lt!350493 (seekEntryOrOpen!0 (select (arr!20480 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42783 (_ BitVec 32)) Bool)

(assert (=> b!786209 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350497 () Unit!27176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27176)

(assert (=> b!786209 (= lt!350497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786210 () Bool)

(declare-fun res!532393 () Bool)

(assert (=> b!786210 (=> (not res!532393) (not e!437036))))

(assert (=> b!786210 (= res!532393 (= (seekEntryOrOpen!0 lt!350496 lt!350504 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350496 lt!350504 mask!3328)))))

(declare-fun b!786211 () Bool)

(assert (=> b!786211 (= e!437029 e!437030)))

(declare-fun res!532388 () Bool)

(assert (=> b!786211 (=> res!532388 e!437030)))

(assert (=> b!786211 (= res!532388 (= lt!350494 lt!350496))))

(assert (=> b!786211 (= lt!350494 (select (store (arr!20480 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786212 () Bool)

(assert (=> b!786212 (= e!437028 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20480 a!3186) j!159) a!3186 mask!3328) (Found!8077 j!159)))))

(declare-fun b!786213 () Bool)

(declare-fun Unit!27178 () Unit!27176)

(assert (=> b!786213 (= e!437027 Unit!27178)))

(assert (=> b!786213 false))

(declare-fun b!786214 () Bool)

(declare-fun res!532386 () Bool)

(assert (=> b!786214 (=> (not res!532386) (not e!437035))))

(assert (=> b!786214 (= res!532386 (and (= (size!20901 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20901 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20901 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786215 () Bool)

(declare-fun res!532390 () Bool)

(assert (=> b!786215 (=> (not res!532390) (not e!437035))))

(declare-fun arrayContainsKey!0 (array!42783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786215 (= res!532390 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786216 () Bool)

(declare-fun res!532391 () Bool)

(assert (=> b!786216 (=> (not res!532391) (not e!437037))))

(assert (=> b!786216 (= res!532391 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20480 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786217 () Bool)

(declare-fun Unit!27179 () Unit!27176)

(assert (=> b!786217 (= e!437027 Unit!27179)))

(declare-fun b!786218 () Bool)

(declare-fun res!532389 () Bool)

(assert (=> b!786218 (=> (not res!532389) (not e!437035))))

(assert (=> b!786218 (= res!532389 (validKeyInArray!0 k0!2102))))

(declare-fun b!786219 () Bool)

(assert (=> b!786219 (= e!437036 (= lt!350493 lt!350495))))

(declare-fun b!786220 () Bool)

(declare-fun res!532399 () Bool)

(assert (=> b!786220 (=> (not res!532399) (not e!437032))))

(assert (=> b!786220 (= res!532399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786221 () Bool)

(assert (=> b!786221 (= e!437028 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20480 a!3186) j!159) a!3186 mask!3328) lt!350502))))

(assert (= (and start!67724 res!532395) b!786214))

(assert (= (and b!786214 res!532386) b!786201))

(assert (= (and b!786201 res!532387) b!786218))

(assert (= (and b!786218 res!532389) b!786215))

(assert (= (and b!786215 res!532390) b!786203))

(assert (= (and b!786203 res!532404) b!786220))

(assert (= (and b!786220 res!532399) b!786202))

(assert (= (and b!786202 res!532394) b!786200))

(assert (= (and b!786200 res!532400) b!786199))

(assert (= (and b!786199 res!532397) b!786216))

(assert (= (and b!786216 res!532391) b!786208))

(assert (= (and b!786208 c!87315) b!786221))

(assert (= (and b!786208 (not c!87315)) b!786212))

(assert (= (and b!786208 res!532398) b!786204))

(assert (= (and b!786204 res!532403) b!786209))

(assert (= (and b!786209 res!532396) b!786207))

(assert (= (and b!786209 (not res!532402)) b!786205))

(assert (= (and b!786205 (not res!532392)) b!786211))

(assert (= (and b!786211 (not res!532388)) b!786206))

(assert (= (and b!786206 c!87314) b!786213))

(assert (= (and b!786206 (not c!87314)) b!786217))

(assert (= (and b!786206 res!532401) b!786210))

(assert (= (and b!786210 res!532393) b!786219))

(declare-fun m!727515 () Bool)

(assert (=> b!786211 m!727515))

(declare-fun m!727517 () Bool)

(assert (=> b!786211 m!727517))

(declare-fun m!727519 () Bool)

(assert (=> b!786216 m!727519))

(declare-fun m!727521 () Bool)

(assert (=> b!786205 m!727521))

(assert (=> b!786205 m!727521))

(declare-fun m!727523 () Bool)

(assert (=> b!786205 m!727523))

(assert (=> b!786207 m!727521))

(assert (=> b!786207 m!727521))

(declare-fun m!727525 () Bool)

(assert (=> b!786207 m!727525))

(declare-fun m!727527 () Bool)

(assert (=> start!67724 m!727527))

(declare-fun m!727529 () Bool)

(assert (=> start!67724 m!727529))

(assert (=> b!786212 m!727521))

(assert (=> b!786212 m!727521))

(assert (=> b!786212 m!727523))

(declare-fun m!727531 () Bool)

(assert (=> b!786202 m!727531))

(assert (=> b!786201 m!727521))

(assert (=> b!786201 m!727521))

(declare-fun m!727533 () Bool)

(assert (=> b!786201 m!727533))

(declare-fun m!727535 () Bool)

(assert (=> b!786220 m!727535))

(declare-fun m!727537 () Bool)

(assert (=> b!786215 m!727537))

(assert (=> b!786221 m!727521))

(assert (=> b!786221 m!727521))

(declare-fun m!727539 () Bool)

(assert (=> b!786221 m!727539))

(declare-fun m!727541 () Bool)

(assert (=> b!786203 m!727541))

(declare-fun m!727543 () Bool)

(assert (=> b!786210 m!727543))

(declare-fun m!727545 () Bool)

(assert (=> b!786210 m!727545))

(declare-fun m!727547 () Bool)

(assert (=> b!786218 m!727547))

(assert (=> b!786209 m!727521))

(assert (=> b!786209 m!727521))

(declare-fun m!727549 () Bool)

(assert (=> b!786209 m!727549))

(declare-fun m!727551 () Bool)

(assert (=> b!786209 m!727551))

(declare-fun m!727553 () Bool)

(assert (=> b!786209 m!727553))

(assert (=> b!786199 m!727521))

(assert (=> b!786199 m!727521))

(declare-fun m!727555 () Bool)

(assert (=> b!786199 m!727555))

(assert (=> b!786199 m!727555))

(assert (=> b!786199 m!727521))

(declare-fun m!727557 () Bool)

(assert (=> b!786199 m!727557))

(assert (=> b!786204 m!727515))

(declare-fun m!727559 () Bool)

(assert (=> b!786204 m!727559))

(declare-fun m!727561 () Bool)

(assert (=> b!786204 m!727561))

(assert (=> b!786204 m!727559))

(declare-fun m!727563 () Bool)

(assert (=> b!786204 m!727563))

(declare-fun m!727565 () Bool)

(assert (=> b!786204 m!727565))

(check-sat (not b!786205) (not b!786210) (not b!786221) (not b!786203) (not b!786199) (not b!786202) (not b!786212) (not b!786218) (not b!786220) (not b!786204) (not start!67724) (not b!786209) (not b!786207) (not b!786215) (not b!786201))
(check-sat)
