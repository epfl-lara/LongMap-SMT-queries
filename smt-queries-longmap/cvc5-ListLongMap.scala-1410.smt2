; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27312 () Bool)

(assert start!27312)

(declare-fun b!283049 () Bool)

(declare-fun e!179591 () Bool)

(declare-fun e!179592 () Bool)

(assert (=> b!283049 (= e!179591 e!179592)))

(declare-fun res!146122 () Bool)

(assert (=> b!283049 (=> (not res!146122) (not e!179592))))

(declare-datatypes ((SeekEntryResult!1865 0))(
  ( (MissingZero!1865 (index!9630 (_ BitVec 32))) (Found!1865 (index!9631 (_ BitVec 32))) (Intermediate!1865 (undefined!2677 Bool) (index!9632 (_ BitVec 32)) (x!27839 (_ BitVec 32))) (Undefined!1865) (MissingVacant!1865 (index!9633 (_ BitVec 32))) )
))
(declare-fun lt!139893 () SeekEntryResult!1865)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!283049 (= res!146122 (or (= lt!139893 (MissingZero!1865 i!1267)) (= lt!139893 (MissingVacant!1865 i!1267))))))

(declare-datatypes ((array!14130 0))(
  ( (array!14131 (arr!6707 (Array (_ BitVec 32) (_ BitVec 64))) (size!7059 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14130)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14130 (_ BitVec 32)) SeekEntryResult!1865)

(assert (=> b!283049 (= lt!139893 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!283050 () Bool)

(declare-fun e!179590 () Bool)

(declare-fun e!179593 () Bool)

(assert (=> b!283050 (= e!179590 (not e!179593))))

(declare-fun res!146124 () Bool)

(assert (=> b!283050 (=> res!146124 e!179593)))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!283050 (= res!146124 (or (bvsge startIndex!26 (bvsub (size!7059 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14130 (_ BitVec 32)) Bool)

(assert (=> b!283050 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9014 0))(
  ( (Unit!9015) )
))
(declare-fun lt!139890 () Unit!9014)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9014)

(assert (=> b!283050 (= lt!139890 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139889 () array!14130)

(assert (=> b!283050 (= (seekEntryOrOpen!0 (select (arr!6707 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6707 a!3325) i!1267 k!2581) startIndex!26) lt!139889 mask!3868))))

(declare-fun lt!139892 () Unit!9014)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14130 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9014)

(assert (=> b!283050 (= lt!139892 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4515 0))(
  ( (Nil!4512) (Cons!4511 (h!5181 (_ BitVec 64)) (t!9597 List!4515)) )
))
(declare-fun arrayNoDuplicates!0 (array!14130 (_ BitVec 32) List!4515) Bool)

(assert (=> b!283050 (arrayNoDuplicates!0 lt!139889 #b00000000000000000000000000000000 Nil!4512)))

(declare-fun lt!139894 () Unit!9014)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14130 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4515) Unit!9014)

(assert (=> b!283050 (= lt!139894 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4512))))

(declare-fun b!283051 () Bool)

(declare-fun res!146125 () Bool)

(assert (=> b!283051 (=> (not res!146125) (not e!179591))))

(assert (=> b!283051 (= res!146125 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4512))))

(declare-fun b!283052 () Bool)

(declare-fun res!146121 () Bool)

(assert (=> b!283052 (=> (not res!146121) (not e!179591))))

(assert (=> b!283052 (= res!146121 (and (= (size!7059 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7059 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7059 a!3325))))))

(declare-fun b!283053 () Bool)

(declare-fun res!146123 () Bool)

(assert (=> b!283053 (=> (not res!146123) (not e!179592))))

(assert (=> b!283053 (= res!146123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283055 () Bool)

(declare-fun res!146127 () Bool)

(assert (=> b!283055 (=> (not res!146127) (not e!179591))))

(declare-fun arrayContainsKey!0 (array!14130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283055 (= res!146127 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283056 () Bool)

(declare-fun res!146118 () Bool)

(assert (=> b!283056 (=> (not res!146118) (not e!179591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283056 (= res!146118 (validKeyInArray!0 k!2581))))

(declare-fun b!283057 () Bool)

(assert (=> b!283057 (= e!179592 e!179590)))

(declare-fun res!146126 () Bool)

(assert (=> b!283057 (=> (not res!146126) (not e!179590))))

(assert (=> b!283057 (= res!146126 (not (= startIndex!26 i!1267)))))

(assert (=> b!283057 (= lt!139889 (array!14131 (store (arr!6707 a!3325) i!1267 k!2581) (size!7059 a!3325)))))

(declare-fun b!283058 () Bool)

(declare-fun res!146119 () Bool)

(assert (=> b!283058 (=> (not res!146119) (not e!179590))))

(assert (=> b!283058 (= res!146119 (validKeyInArray!0 (select (arr!6707 a!3325) startIndex!26)))))

(declare-fun res!146120 () Bool)

(assert (=> start!27312 (=> (not res!146120) (not e!179591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27312 (= res!146120 (validMask!0 mask!3868))))

(assert (=> start!27312 e!179591))

(declare-fun array_inv!4670 (array!14130) Bool)

(assert (=> start!27312 (array_inv!4670 a!3325)))

(assert (=> start!27312 true))

(declare-fun b!283054 () Bool)

(assert (=> b!283054 (= e!179593 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139889 mask!3868))))

(assert (=> b!283054 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139889 mask!3868)))

(declare-fun lt!139891 () Unit!9014)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14130 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9014)

(assert (=> b!283054 (= lt!139891 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (= (and start!27312 res!146120) b!283052))

(assert (= (and b!283052 res!146121) b!283056))

(assert (= (and b!283056 res!146118) b!283051))

(assert (= (and b!283051 res!146125) b!283055))

(assert (= (and b!283055 res!146127) b!283049))

(assert (= (and b!283049 res!146122) b!283053))

(assert (= (and b!283053 res!146123) b!283057))

(assert (= (and b!283057 res!146126) b!283058))

(assert (= (and b!283058 res!146119) b!283050))

(assert (= (and b!283050 (not res!146124)) b!283054))

(declare-fun m!297819 () Bool)

(assert (=> b!283057 m!297819))

(declare-fun m!297821 () Bool)

(assert (=> b!283051 m!297821))

(declare-fun m!297823 () Bool)

(assert (=> b!283050 m!297823))

(declare-fun m!297825 () Bool)

(assert (=> b!283050 m!297825))

(declare-fun m!297827 () Bool)

(assert (=> b!283050 m!297827))

(assert (=> b!283050 m!297819))

(declare-fun m!297829 () Bool)

(assert (=> b!283050 m!297829))

(declare-fun m!297831 () Bool)

(assert (=> b!283050 m!297831))

(declare-fun m!297833 () Bool)

(assert (=> b!283050 m!297833))

(assert (=> b!283050 m!297831))

(declare-fun m!297835 () Bool)

(assert (=> b!283050 m!297835))

(declare-fun m!297837 () Bool)

(assert (=> b!283050 m!297837))

(assert (=> b!283050 m!297827))

(declare-fun m!297839 () Bool)

(assert (=> b!283050 m!297839))

(declare-fun m!297841 () Bool)

(assert (=> start!27312 m!297841))

(declare-fun m!297843 () Bool)

(assert (=> start!27312 m!297843))

(declare-fun m!297845 () Bool)

(assert (=> b!283054 m!297845))

(declare-fun m!297847 () Bool)

(assert (=> b!283054 m!297847))

(declare-fun m!297849 () Bool)

(assert (=> b!283054 m!297849))

(declare-fun m!297851 () Bool)

(assert (=> b!283049 m!297851))

(declare-fun m!297853 () Bool)

(assert (=> b!283053 m!297853))

(declare-fun m!297855 () Bool)

(assert (=> b!283056 m!297855))

(declare-fun m!297857 () Bool)

(assert (=> b!283055 m!297857))

(assert (=> b!283058 m!297831))

(assert (=> b!283058 m!297831))

(declare-fun m!297859 () Bool)

(assert (=> b!283058 m!297859))

(push 1)

(assert (not b!283056))

(assert (not b!283054))

(assert (not b!283055))

(assert (not start!27312))

(assert (not b!283050))

(assert (not b!283053))

(assert (not b!283058))

(assert (not b!283049))

(assert (not b!283051))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!283155 () Bool)

(declare-fun e!179657 () Bool)

(declare-fun call!25466 () Bool)

(assert (=> b!283155 (= e!179657 call!25466)))

(declare-fun b!283156 () Bool)

(declare-fun e!179655 () Bool)

(assert (=> b!283156 (= e!179655 e!179657)))

(declare-fun c!46024 () Bool)

(assert (=> b!283156 (= c!46024 (validKeyInArray!0 (select (arr!6707 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25463 () Bool)

(assert (=> bm!25463 (= call!25466 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65273 () Bool)

(declare-fun res!146213 () Bool)

(assert (=> d!65273 (=> res!146213 e!179655)))

(assert (=> d!65273 (= res!146213 (bvsge #b00000000000000000000000000000000 (size!7059 a!3325)))))

(assert (=> d!65273 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!179655)))

(declare-fun b!283157 () Bool)

(declare-fun e!179656 () Bool)

(assert (=> b!283157 (= e!179656 call!25466)))

(declare-fun b!283158 () Bool)

(assert (=> b!283158 (= e!179657 e!179656)))

(declare-fun lt!139957 () (_ BitVec 64))

(assert (=> b!283158 (= lt!139957 (select (arr!6707 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!139956 () Unit!9014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14130 (_ BitVec 64) (_ BitVec 32)) Unit!9014)

(assert (=> b!283158 (= lt!139956 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!139957 #b00000000000000000000000000000000))))

(assert (=> b!283158 (arrayContainsKey!0 a!3325 lt!139957 #b00000000000000000000000000000000)))

(declare-fun lt!139955 () Unit!9014)

(assert (=> b!283158 (= lt!139955 lt!139956)))

(declare-fun res!146212 () Bool)

(assert (=> b!283158 (= res!146212 (= (seekEntryOrOpen!0 (select (arr!6707 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1865 #b00000000000000000000000000000000)))))

(assert (=> b!283158 (=> (not res!146212) (not e!179656))))

(assert (= (and d!65273 (not res!146213)) b!283156))

(assert (= (and b!283156 c!46024) b!283158))

(assert (= (and b!283156 (not c!46024)) b!283155))

(assert (= (and b!283158 res!146212) b!283157))

(assert (= (or b!283157 b!283155) bm!25463))

(declare-fun m!297981 () Bool)

(assert (=> b!283156 m!297981))

(assert (=> b!283156 m!297981))

(declare-fun m!297983 () Bool)

(assert (=> b!283156 m!297983))

(declare-fun m!297985 () Bool)

(assert (=> bm!25463 m!297985))

(assert (=> b!283158 m!297981))

(declare-fun m!297987 () Bool)

(assert (=> b!283158 m!297987))

(declare-fun m!297989 () Bool)

(assert (=> b!283158 m!297989))

(assert (=> b!283158 m!297981))

(declare-fun m!297991 () Bool)

(assert (=> b!283158 m!297991))

(assert (=> b!283053 d!65273))

(declare-fun d!65281 () Bool)

(assert (=> d!65281 (= (validKeyInArray!0 (select (arr!6707 a!3325) startIndex!26)) (and (not (= (select (arr!6707 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6707 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283058 d!65281))

(declare-fun b!283215 () Bool)

(declare-fun e!179691 () SeekEntryResult!1865)

(declare-fun lt!139984 () SeekEntryResult!1865)

(assert (=> b!283215 (= e!179691 (MissingZero!1865 (index!9632 lt!139984)))))

(declare-fun b!283216 () Bool)

(declare-fun e!179692 () SeekEntryResult!1865)

(declare-fun e!179690 () SeekEntryResult!1865)

(assert (=> b!283216 (= e!179692 e!179690)))

(declare-fun lt!139985 () (_ BitVec 64))

(assert (=> b!283216 (= lt!139985 (select (arr!6707 a!3325) (index!9632 lt!139984)))))

(declare-fun c!46051 () Bool)

(assert (=> b!283216 (= c!46051 (= lt!139985 k!2581))))

(declare-fun b!283218 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14130 (_ BitVec 32)) SeekEntryResult!1865)

(assert (=> b!283218 (= e!179691 (seekKeyOrZeroReturnVacant!0 (x!27839 lt!139984) (index!9632 lt!139984) (index!9632 lt!139984) k!2581 a!3325 mask!3868))))

(declare-fun b!283219 () Bool)

(assert (=> b!283219 (= e!179690 (Found!1865 (index!9632 lt!139984)))))

(declare-fun b!283220 () Bool)

(declare-fun c!46050 () Bool)

(assert (=> b!283220 (= c!46050 (= lt!139985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283220 (= e!179690 e!179691)))

(declare-fun d!65283 () Bool)

(declare-fun lt!139986 () SeekEntryResult!1865)

(assert (=> d!65283 (and (or (is-Undefined!1865 lt!139986) (not (is-Found!1865 lt!139986)) (and (bvsge (index!9631 lt!139986) #b00000000000000000000000000000000) (bvslt (index!9631 lt!139986) (size!7059 a!3325)))) (or (is-Undefined!1865 lt!139986) (is-Found!1865 lt!139986) (not (is-MissingZero!1865 lt!139986)) (and (bvsge (index!9630 lt!139986) #b00000000000000000000000000000000) (bvslt (index!9630 lt!139986) (size!7059 a!3325)))) (or (is-Undefined!1865 lt!139986) (is-Found!1865 lt!139986) (is-MissingZero!1865 lt!139986) (not (is-MissingVacant!1865 lt!139986)) (and (bvsge (index!9633 lt!139986) #b00000000000000000000000000000000) (bvslt (index!9633 lt!139986) (size!7059 a!3325)))) (or (is-Undefined!1865 lt!139986) (ite (is-Found!1865 lt!139986) (= (select (arr!6707 a!3325) (index!9631 lt!139986)) k!2581) (ite (is-MissingZero!1865 lt!139986) (= (select (arr!6707 a!3325) (index!9630 lt!139986)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1865 lt!139986) (= (select (arr!6707 a!3325) (index!9633 lt!139986)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65283 (= lt!139986 e!179692)))

(declare-fun c!46049 () Bool)

(assert (=> d!65283 (= c!46049 (and (is-Intermediate!1865 lt!139984) (undefined!2677 lt!139984)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14130 (_ BitVec 32)) SeekEntryResult!1865)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65283 (= lt!139984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65283 (validMask!0 mask!3868)))

(assert (=> d!65283 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!139986)))

(declare-fun b!283217 () Bool)

(assert (=> b!283217 (= e!179692 Undefined!1865)))

(assert (= (and d!65283 c!46049) b!283217))

(assert (= (and d!65283 (not c!46049)) b!283216))

(assert (= (and b!283216 c!46051) b!283219))

(assert (= (and b!283216 (not c!46051)) b!283220))

(assert (= (and b!283220 c!46050) b!283215))

(assert (= (and b!283220 (not c!46050)) b!283218))

(declare-fun m!298029 () Bool)

(assert (=> b!283216 m!298029))

(declare-fun m!298031 () Bool)

(assert (=> b!283218 m!298031))

(declare-fun m!298033 () Bool)

(assert (=> d!65283 m!298033))

(declare-fun m!298035 () Bool)

(assert (=> d!65283 m!298035))

(assert (=> d!65283 m!297841))

(declare-fun m!298037 () Bool)

(assert (=> d!65283 m!298037))

(declare-fun m!298039 () Bool)

(assert (=> d!65283 m!298039))

(assert (=> d!65283 m!298039))

(declare-fun m!298041 () Bool)

(assert (=> d!65283 m!298041))

(assert (=> b!283049 d!65283))

(declare-fun b!283234 () Bool)

(declare-fun e!179705 () Bool)

(declare-fun call!25468 () Bool)

(assert (=> b!283234 (= e!179705 call!25468)))

(declare-fun b!283235 () Bool)

(declare-fun e!179703 () Bool)

(assert (=> b!283235 (= e!179703 e!179705)))

(declare-fun c!46055 () Bool)

(assert (=> b!283235 (= c!46055 (validKeyInArray!0 (select (arr!6707 lt!139889) startIndex!26)))))

(declare-fun bm!25465 () Bool)

(assert (=> bm!25465 (= call!25468 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!139889 mask!3868))))

(declare-fun d!65293 () Bool)

(declare-fun res!146230 () Bool)

(assert (=> d!65293 (=> res!146230 e!179703)))

(assert (=> d!65293 (= res!146230 (bvsge startIndex!26 (size!7059 lt!139889)))))

(assert (=> d!65293 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139889 mask!3868) e!179703)))

(declare-fun b!283236 () Bool)

(declare-fun e!179704 () Bool)

(assert (=> b!283236 (= e!179704 call!25468)))

(declare-fun b!283237 () Bool)

(assert (=> b!283237 (= e!179705 e!179704)))

(declare-fun lt!139999 () (_ BitVec 64))

(assert (=> b!283237 (= lt!139999 (select (arr!6707 lt!139889) startIndex!26))))

(declare-fun lt!139998 () Unit!9014)

(assert (=> b!283237 (= lt!139998 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139889 lt!139999 startIndex!26))))

(assert (=> b!283237 (arrayContainsKey!0 lt!139889 lt!139999 #b00000000000000000000000000000000)))

(declare-fun lt!139997 () Unit!9014)

(assert (=> b!283237 (= lt!139997 lt!139998)))

(declare-fun res!146229 () Bool)

(assert (=> b!283237 (= res!146229 (= (seekEntryOrOpen!0 (select (arr!6707 lt!139889) startIndex!26) lt!139889 mask!3868) (Found!1865 startIndex!26)))))

(assert (=> b!283237 (=> (not res!146229) (not e!179704))))

(assert (= (and d!65293 (not res!146230)) b!283235))

(assert (= (and b!283235 c!46055) b!283237))

(assert (= (and b!283235 (not c!46055)) b!283234))

(assert (= (and b!283237 res!146229) b!283236))

(assert (= (or b!283236 b!283234) bm!25465))

(declare-fun m!298049 () Bool)

(assert (=> b!283235 m!298049))

(assert (=> b!283235 m!298049))

(declare-fun m!298051 () Bool)

(assert (=> b!283235 m!298051))

(declare-fun m!298053 () Bool)

(assert (=> bm!25465 m!298053))

(assert (=> b!283237 m!298049))

(declare-fun m!298055 () Bool)

(assert (=> b!283237 m!298055))

(declare-fun m!298057 () Bool)

(assert (=> b!283237 m!298057))

(assert (=> b!283237 m!298049))

(declare-fun m!298059 () Bool)

(assert (=> b!283237 m!298059))

(assert (=> b!283054 d!65293))

(declare-fun b!283238 () Bool)

(declare-fun e!179708 () Bool)

(declare-fun call!25471 () Bool)

(assert (=> b!283238 (= e!179708 call!25471)))

(declare-fun b!283239 () Bool)

(declare-fun e!179706 () Bool)

(assert (=> b!283239 (= e!179706 e!179708)))

(declare-fun c!46056 () Bool)

(assert (=> b!283239 (= c!46056 (validKeyInArray!0 (select (arr!6707 lt!139889) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun bm!25468 () Bool)

(assert (=> bm!25468 (= call!25471 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!139889 mask!3868))))

(declare-fun d!65297 () Bool)

(declare-fun res!146232 () Bool)

(assert (=> d!65297 (=> res!146232 e!179706)))

(assert (=> d!65297 (= res!146232 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!7059 lt!139889)))))

(assert (=> d!65297 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139889 mask!3868) e!179706)))

(declare-fun b!283240 () Bool)

(declare-fun e!179707 () Bool)

(assert (=> b!283240 (= e!179707 call!25471)))

(declare-fun b!283241 () Bool)

(assert (=> b!283241 (= e!179708 e!179707)))

(declare-fun lt!140002 () (_ BitVec 64))

(assert (=> b!283241 (= lt!140002 (select (arr!6707 lt!139889) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!140001 () Unit!9014)

(assert (=> b!283241 (= lt!140001 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139889 lt!140002 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!283241 (arrayContainsKey!0 lt!139889 lt!140002 #b00000000000000000000000000000000)))

(declare-fun lt!140000 () Unit!9014)

(assert (=> b!283241 (= lt!140000 lt!140001)))

(declare-fun res!146231 () Bool)

(assert (=> b!283241 (= res!146231 (= (seekEntryOrOpen!0 (select (arr!6707 lt!139889) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!139889 mask!3868) (Found!1865 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!283241 (=> (not res!146231) (not e!179707))))

(assert (= (and d!65297 (not res!146232)) b!283239))

(assert (= (and b!283239 c!46056) b!283241))

(assert (= (and b!283239 (not c!46056)) b!283238))

(assert (= (and b!283241 res!146231) b!283240))

(assert (= (or b!283240 b!283238) bm!25468))

(declare-fun m!298061 () Bool)

(assert (=> b!283239 m!298061))

(assert (=> b!283239 m!298061))

(declare-fun m!298063 () Bool)

(assert (=> b!283239 m!298063))

(declare-fun m!298065 () Bool)

(assert (=> bm!25468 m!298065))

(assert (=> b!283241 m!298061))

(declare-fun m!298067 () Bool)

(assert (=> b!283241 m!298067))

(declare-fun m!298069 () Bool)

(assert (=> b!283241 m!298069))

(assert (=> b!283241 m!298061))

(declare-fun m!298071 () Bool)

(assert (=> b!283241 m!298071))

(assert (=> b!283054 d!65297))

(declare-fun d!65299 () Bool)

(declare-fun e!179735 () Bool)

(assert (=> d!65299 e!179735))

(declare-fun res!146250 () Bool)

(assert (=> d!65299 (=> (not res!146250) (not e!179735))))

(assert (=> d!65299 (= res!146250 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7059 a!3325))))))

(declare-fun lt!140017 () Unit!9014)

(declare-fun choose!98 (array!14130 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9014)

(assert (=> d!65299 (= lt!140017 (choose!98 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!65299 (validMask!0 mask!3868)))

(assert (=> d!65299 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!140017)))

(declare-fun b!283277 () Bool)

(assert (=> b!283277 (= e!179735 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14131 (store (arr!6707 a!3325) i!1267 k!2581) (size!7059 a!3325)) mask!3868))))

(assert (= (and d!65299 res!146250) b!283277))

(declare-fun m!298117 () Bool)

(assert (=> d!65299 m!298117))

(assert (=> d!65299 m!297841))

(assert (=> b!283277 m!297819))

(declare-fun m!298123 () Bool)

(assert (=> b!283277 m!298123))

(assert (=> b!283054 d!65299))

(declare-fun d!65309 () Bool)

(assert (=> d!65309 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27312 d!65309))

(declare-fun d!65323 () Bool)

(assert (=> d!65323 (= (array_inv!4670 a!3325) (bvsge (size!7059 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27312 d!65323))

(declare-fun d!65325 () Bool)

(assert (=> d!65325 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283056 d!65325))

(declare-fun d!65327 () Bool)

(declare-fun res!146272 () Bool)

(declare-fun e!179765 () Bool)

(assert (=> d!65327 (=> res!146272 e!179765)))

(assert (=> d!65327 (= res!146272 (= (select (arr!6707 a!3325) #b00000000000000000000000000000000) k!2581))))

