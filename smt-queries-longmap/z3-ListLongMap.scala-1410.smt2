; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27312 () Bool)

(assert start!27312)

(declare-fun b!283096 () Bool)

(declare-fun res!146146 () Bool)

(declare-fun e!179615 () Bool)

(assert (=> b!283096 (=> (not res!146146) (not e!179615))))

(declare-datatypes ((array!14129 0))(
  ( (array!14130 (arr!6706 (Array (_ BitVec 32) (_ BitVec 64))) (size!7058 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14129)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283096 (= res!146146 (validKeyInArray!0 (select (arr!6706 a!3325) startIndex!26)))))

(declare-fun b!283097 () Bool)

(declare-fun e!179617 () Bool)

(declare-fun e!179614 () Bool)

(assert (=> b!283097 (= e!179617 e!179614)))

(declare-fun res!146147 () Bool)

(assert (=> b!283097 (=> (not res!146147) (not e!179614))))

(declare-datatypes ((SeekEntryResult!1829 0))(
  ( (MissingZero!1829 (index!9486 (_ BitVec 32))) (Found!1829 (index!9487 (_ BitVec 32))) (Intermediate!1829 (undefined!2641 Bool) (index!9488 (_ BitVec 32)) (x!27803 (_ BitVec 32))) (Undefined!1829) (MissingVacant!1829 (index!9489 (_ BitVec 32))) )
))
(declare-fun lt!139951 () SeekEntryResult!1829)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!283097 (= res!146147 (or (= lt!139951 (MissingZero!1829 i!1267)) (= lt!139951 (MissingVacant!1829 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14129 (_ BitVec 32)) SeekEntryResult!1829)

(assert (=> b!283097 (= lt!139951 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!146140 () Bool)

(assert (=> start!27312 (=> (not res!146140) (not e!179617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27312 (= res!146140 (validMask!0 mask!3868))))

(assert (=> start!27312 e!179617))

(declare-fun array_inv!4656 (array!14129) Bool)

(assert (=> start!27312 (array_inv!4656 a!3325)))

(assert (=> start!27312 true))

(declare-fun b!283098 () Bool)

(declare-fun res!146148 () Bool)

(assert (=> b!283098 (=> (not res!146148) (not e!179617))))

(declare-fun arrayContainsKey!0 (array!14129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283098 (= res!146148 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283099 () Bool)

(declare-fun e!179616 () Bool)

(assert (=> b!283099 (= e!179615 (not e!179616))))

(declare-fun res!146144 () Bool)

(assert (=> b!283099 (=> res!146144 e!179616)))

(assert (=> b!283099 (= res!146144 (or (bvsge startIndex!26 (bvsub (size!7058 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14129 (_ BitVec 32)) Bool)

(assert (=> b!283099 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8988 0))(
  ( (Unit!8989) )
))
(declare-fun lt!139953 () Unit!8988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8988)

(assert (=> b!283099 (= lt!139953 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139949 () array!14129)

(assert (=> b!283099 (= (seekEntryOrOpen!0 (select (arr!6706 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6706 a!3325) i!1267 k0!2581) startIndex!26) lt!139949 mask!3868))))

(declare-fun lt!139952 () Unit!8988)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8988)

(assert (=> b!283099 (= lt!139952 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4427 0))(
  ( (Nil!4424) (Cons!4423 (h!5093 (_ BitVec 64)) (t!9501 List!4427)) )
))
(declare-fun arrayNoDuplicates!0 (array!14129 (_ BitVec 32) List!4427) Bool)

(assert (=> b!283099 (arrayNoDuplicates!0 lt!139949 #b00000000000000000000000000000000 Nil!4424)))

(declare-fun lt!139948 () Unit!8988)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14129 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4427) Unit!8988)

(assert (=> b!283099 (= lt!139948 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4424))))

(declare-fun b!283100 () Bool)

(declare-fun res!146142 () Bool)

(assert (=> b!283100 (=> (not res!146142) (not e!179617))))

(assert (=> b!283100 (= res!146142 (and (= (size!7058 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7058 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7058 a!3325))))))

(declare-fun b!283101 () Bool)

(assert (=> b!283101 (= e!179616 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139949 mask!3868))))

(assert (=> b!283101 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139949 mask!3868)))

(declare-fun lt!139950 () Unit!8988)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8988)

(assert (=> b!283101 (= lt!139950 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!283102 () Bool)

(declare-fun res!146139 () Bool)

(assert (=> b!283102 (=> (not res!146139) (not e!179617))))

(assert (=> b!283102 (= res!146139 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4424))))

(declare-fun b!283103 () Bool)

(assert (=> b!283103 (= e!179614 e!179615)))

(declare-fun res!146145 () Bool)

(assert (=> b!283103 (=> (not res!146145) (not e!179615))))

(assert (=> b!283103 (= res!146145 (not (= startIndex!26 i!1267)))))

(assert (=> b!283103 (= lt!139949 (array!14130 (store (arr!6706 a!3325) i!1267 k0!2581) (size!7058 a!3325)))))

(declare-fun b!283104 () Bool)

(declare-fun res!146141 () Bool)

(assert (=> b!283104 (=> (not res!146141) (not e!179617))))

(assert (=> b!283104 (= res!146141 (validKeyInArray!0 k0!2581))))

(declare-fun b!283105 () Bool)

(declare-fun res!146143 () Bool)

(assert (=> b!283105 (=> (not res!146143) (not e!179614))))

(assert (=> b!283105 (= res!146143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27312 res!146140) b!283100))

(assert (= (and b!283100 res!146142) b!283104))

(assert (= (and b!283104 res!146141) b!283102))

(assert (= (and b!283102 res!146139) b!283098))

(assert (= (and b!283098 res!146148) b!283097))

(assert (= (and b!283097 res!146147) b!283105))

(assert (= (and b!283105 res!146143) b!283103))

(assert (= (and b!283103 res!146145) b!283096))

(assert (= (and b!283096 res!146146) b!283099))

(assert (= (and b!283099 (not res!146144)) b!283101))

(declare-fun m!298025 () Bool)

(assert (=> b!283105 m!298025))

(declare-fun m!298027 () Bool)

(assert (=> b!283098 m!298027))

(declare-fun m!298029 () Bool)

(assert (=> b!283099 m!298029))

(declare-fun m!298031 () Bool)

(assert (=> b!283099 m!298031))

(declare-fun m!298033 () Bool)

(assert (=> b!283099 m!298033))

(assert (=> b!283099 m!298031))

(declare-fun m!298035 () Bool)

(assert (=> b!283099 m!298035))

(declare-fun m!298037 () Bool)

(assert (=> b!283099 m!298037))

(declare-fun m!298039 () Bool)

(assert (=> b!283099 m!298039))

(declare-fun m!298041 () Bool)

(assert (=> b!283099 m!298041))

(declare-fun m!298043 () Bool)

(assert (=> b!283099 m!298043))

(assert (=> b!283099 m!298039))

(declare-fun m!298045 () Bool)

(assert (=> b!283099 m!298045))

(declare-fun m!298047 () Bool)

(assert (=> b!283099 m!298047))

(assert (=> b!283096 m!298039))

(assert (=> b!283096 m!298039))

(declare-fun m!298049 () Bool)

(assert (=> b!283096 m!298049))

(declare-fun m!298051 () Bool)

(assert (=> start!27312 m!298051))

(declare-fun m!298053 () Bool)

(assert (=> start!27312 m!298053))

(declare-fun m!298055 () Bool)

(assert (=> b!283097 m!298055))

(declare-fun m!298057 () Bool)

(assert (=> b!283104 m!298057))

(assert (=> b!283103 m!298035))

(declare-fun m!298059 () Bool)

(assert (=> b!283101 m!298059))

(declare-fun m!298061 () Bool)

(assert (=> b!283101 m!298061))

(declare-fun m!298063 () Bool)

(assert (=> b!283101 m!298063))

(declare-fun m!298065 () Bool)

(assert (=> b!283102 m!298065))

(check-sat (not b!283101) (not b!283096) (not b!283098) (not b!283099) (not b!283097) (not b!283105) (not start!27312) (not b!283102) (not b!283104))
(check-sat)
(get-model)

(declare-fun b!283178 () Bool)

(declare-fun e!179656 () SeekEntryResult!1829)

(declare-fun lt!139996 () SeekEntryResult!1829)

(assert (=> b!283178 (= e!179656 (Found!1829 (index!9488 lt!139996)))))

(declare-fun b!283179 () Bool)

(declare-fun e!179655 () SeekEntryResult!1829)

(assert (=> b!283179 (= e!179655 Undefined!1829)))

(declare-fun d!65325 () Bool)

(declare-fun lt!139998 () SeekEntryResult!1829)

(get-info :version)

(assert (=> d!65325 (and (or ((_ is Undefined!1829) lt!139998) (not ((_ is Found!1829) lt!139998)) (and (bvsge (index!9487 lt!139998) #b00000000000000000000000000000000) (bvslt (index!9487 lt!139998) (size!7058 lt!139949)))) (or ((_ is Undefined!1829) lt!139998) ((_ is Found!1829) lt!139998) (not ((_ is MissingZero!1829) lt!139998)) (and (bvsge (index!9486 lt!139998) #b00000000000000000000000000000000) (bvslt (index!9486 lt!139998) (size!7058 lt!139949)))) (or ((_ is Undefined!1829) lt!139998) ((_ is Found!1829) lt!139998) ((_ is MissingZero!1829) lt!139998) (not ((_ is MissingVacant!1829) lt!139998)) (and (bvsge (index!9489 lt!139998) #b00000000000000000000000000000000) (bvslt (index!9489 lt!139998) (size!7058 lt!139949)))) (or ((_ is Undefined!1829) lt!139998) (ite ((_ is Found!1829) lt!139998) (= (select (arr!6706 lt!139949) (index!9487 lt!139998)) (select (store (arr!6706 a!3325) i!1267 k0!2581) startIndex!26)) (ite ((_ is MissingZero!1829) lt!139998) (= (select (arr!6706 lt!139949) (index!9486 lt!139998)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1829) lt!139998) (= (select (arr!6706 lt!139949) (index!9489 lt!139998)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65325 (= lt!139998 e!179655)))

(declare-fun c!46039 () Bool)

(assert (=> d!65325 (= c!46039 (and ((_ is Intermediate!1829) lt!139996) (undefined!2641 lt!139996)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14129 (_ BitVec 32)) SeekEntryResult!1829)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65325 (= lt!139996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6706 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6706 a!3325) i!1267 k0!2581) startIndex!26) lt!139949 mask!3868))))

(assert (=> d!65325 (validMask!0 mask!3868)))

(assert (=> d!65325 (= (seekEntryOrOpen!0 (select (store (arr!6706 a!3325) i!1267 k0!2581) startIndex!26) lt!139949 mask!3868) lt!139998)))

(declare-fun b!283180 () Bool)

(declare-fun c!46038 () Bool)

(declare-fun lt!139997 () (_ BitVec 64))

(assert (=> b!283180 (= c!46038 (= lt!139997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179657 () SeekEntryResult!1829)

(assert (=> b!283180 (= e!179656 e!179657)))

(declare-fun b!283181 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14129 (_ BitVec 32)) SeekEntryResult!1829)

(assert (=> b!283181 (= e!179657 (seekKeyOrZeroReturnVacant!0 (x!27803 lt!139996) (index!9488 lt!139996) (index!9488 lt!139996) (select (store (arr!6706 a!3325) i!1267 k0!2581) startIndex!26) lt!139949 mask!3868))))

(declare-fun b!283182 () Bool)

(assert (=> b!283182 (= e!179655 e!179656)))

(assert (=> b!283182 (= lt!139997 (select (arr!6706 lt!139949) (index!9488 lt!139996)))))

(declare-fun c!46037 () Bool)

(assert (=> b!283182 (= c!46037 (= lt!139997 (select (store (arr!6706 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun b!283183 () Bool)

(assert (=> b!283183 (= e!179657 (MissingZero!1829 (index!9488 lt!139996)))))

(assert (= (and d!65325 c!46039) b!283179))

(assert (= (and d!65325 (not c!46039)) b!283182))

(assert (= (and b!283182 c!46037) b!283178))

(assert (= (and b!283182 (not c!46037)) b!283180))

(assert (= (and b!283180 c!46038) b!283183))

(assert (= (and b!283180 (not c!46038)) b!283181))

(assert (=> d!65325 m!298051))

(declare-fun m!298151 () Bool)

(assert (=> d!65325 m!298151))

(declare-fun m!298153 () Bool)

(assert (=> d!65325 m!298153))

(assert (=> d!65325 m!298031))

(declare-fun m!298155 () Bool)

(assert (=> d!65325 m!298155))

(assert (=> d!65325 m!298031))

(assert (=> d!65325 m!298153))

(declare-fun m!298157 () Bool)

(assert (=> d!65325 m!298157))

(declare-fun m!298159 () Bool)

(assert (=> d!65325 m!298159))

(assert (=> b!283181 m!298031))

(declare-fun m!298161 () Bool)

(assert (=> b!283181 m!298161))

(declare-fun m!298163 () Bool)

(assert (=> b!283182 m!298163))

(assert (=> b!283099 d!65325))

(declare-fun d!65327 () Bool)

(declare-fun e!179666 () Bool)

(assert (=> d!65327 e!179666))

(declare-fun res!146217 () Bool)

(assert (=> d!65327 (=> (not res!146217) (not e!179666))))

(assert (=> d!65327 (= res!146217 (and (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7058 a!3325)) (and (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7058 a!3325)))) (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7058 a!3325)) (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7058 a!3325)))) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7058 a!3325))))))

(declare-fun lt!140001 () Unit!8988)

(declare-fun choose!83 (array!14129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8988)

(assert (=> d!65327 (= lt!140001 (choose!83 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> d!65327 (validMask!0 mask!3868)))

(assert (=> d!65327 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868) lt!140001)))

(declare-fun b!283192 () Bool)

(assert (=> b!283192 (= e!179666 (= (seekEntryOrOpen!0 (select (arr!6706 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6706 a!3325) i!1267 k0!2581) startIndex!26) (array!14130 (store (arr!6706 a!3325) i!1267 k0!2581) (size!7058 a!3325)) mask!3868)))))

(assert (= (and d!65327 res!146217) b!283192))

(declare-fun m!298169 () Bool)

(assert (=> d!65327 m!298169))

(assert (=> d!65327 m!298051))

(assert (=> b!283192 m!298031))

(declare-fun m!298171 () Bool)

(assert (=> b!283192 m!298171))

(assert (=> b!283192 m!298035))

(assert (=> b!283192 m!298031))

(assert (=> b!283192 m!298039))

(assert (=> b!283192 m!298045))

(assert (=> b!283192 m!298039))

(assert (=> b!283099 d!65327))

(declare-fun b!283193 () Bool)

(declare-fun e!179668 () SeekEntryResult!1829)

(declare-fun lt!140002 () SeekEntryResult!1829)

(assert (=> b!283193 (= e!179668 (Found!1829 (index!9488 lt!140002)))))

(declare-fun b!283194 () Bool)

(declare-fun e!179667 () SeekEntryResult!1829)

(assert (=> b!283194 (= e!179667 Undefined!1829)))

(declare-fun d!65335 () Bool)

(declare-fun lt!140004 () SeekEntryResult!1829)

(assert (=> d!65335 (and (or ((_ is Undefined!1829) lt!140004) (not ((_ is Found!1829) lt!140004)) (and (bvsge (index!9487 lt!140004) #b00000000000000000000000000000000) (bvslt (index!9487 lt!140004) (size!7058 a!3325)))) (or ((_ is Undefined!1829) lt!140004) ((_ is Found!1829) lt!140004) (not ((_ is MissingZero!1829) lt!140004)) (and (bvsge (index!9486 lt!140004) #b00000000000000000000000000000000) (bvslt (index!9486 lt!140004) (size!7058 a!3325)))) (or ((_ is Undefined!1829) lt!140004) ((_ is Found!1829) lt!140004) ((_ is MissingZero!1829) lt!140004) (not ((_ is MissingVacant!1829) lt!140004)) (and (bvsge (index!9489 lt!140004) #b00000000000000000000000000000000) (bvslt (index!9489 lt!140004) (size!7058 a!3325)))) (or ((_ is Undefined!1829) lt!140004) (ite ((_ is Found!1829) lt!140004) (= (select (arr!6706 a!3325) (index!9487 lt!140004)) (select (arr!6706 a!3325) startIndex!26)) (ite ((_ is MissingZero!1829) lt!140004) (= (select (arr!6706 a!3325) (index!9486 lt!140004)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1829) lt!140004) (= (select (arr!6706 a!3325) (index!9489 lt!140004)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65335 (= lt!140004 e!179667)))

(declare-fun c!46042 () Bool)

(assert (=> d!65335 (= c!46042 (and ((_ is Intermediate!1829) lt!140002) (undefined!2641 lt!140002)))))

(assert (=> d!65335 (= lt!140002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6706 a!3325) startIndex!26) mask!3868) (select (arr!6706 a!3325) startIndex!26) a!3325 mask!3868))))

(assert (=> d!65335 (validMask!0 mask!3868)))

(assert (=> d!65335 (= (seekEntryOrOpen!0 (select (arr!6706 a!3325) startIndex!26) a!3325 mask!3868) lt!140004)))

(declare-fun b!283195 () Bool)

(declare-fun c!46041 () Bool)

(declare-fun lt!140003 () (_ BitVec 64))

(assert (=> b!283195 (= c!46041 (= lt!140003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179669 () SeekEntryResult!1829)

(assert (=> b!283195 (= e!179668 e!179669)))

(declare-fun b!283196 () Bool)

(assert (=> b!283196 (= e!179669 (seekKeyOrZeroReturnVacant!0 (x!27803 lt!140002) (index!9488 lt!140002) (index!9488 lt!140002) (select (arr!6706 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283197 () Bool)

(assert (=> b!283197 (= e!179667 e!179668)))

(assert (=> b!283197 (= lt!140003 (select (arr!6706 a!3325) (index!9488 lt!140002)))))

(declare-fun c!46040 () Bool)

(assert (=> b!283197 (= c!46040 (= lt!140003 (select (arr!6706 a!3325) startIndex!26)))))

(declare-fun b!283198 () Bool)

(assert (=> b!283198 (= e!179669 (MissingZero!1829 (index!9488 lt!140002)))))

(assert (= (and d!65335 c!46042) b!283194))

(assert (= (and d!65335 (not c!46042)) b!283197))

(assert (= (and b!283197 c!46040) b!283193))

(assert (= (and b!283197 (not c!46040)) b!283195))

(assert (= (and b!283195 c!46041) b!283198))

(assert (= (and b!283195 (not c!46041)) b!283196))

(assert (=> d!65335 m!298051))

(declare-fun m!298173 () Bool)

(assert (=> d!65335 m!298173))

(declare-fun m!298175 () Bool)

(assert (=> d!65335 m!298175))

(assert (=> d!65335 m!298039))

(declare-fun m!298177 () Bool)

(assert (=> d!65335 m!298177))

(assert (=> d!65335 m!298039))

(assert (=> d!65335 m!298175))

(declare-fun m!298179 () Bool)

(assert (=> d!65335 m!298179))

(declare-fun m!298181 () Bool)

(assert (=> d!65335 m!298181))

(assert (=> b!283196 m!298039))

(declare-fun m!298183 () Bool)

(assert (=> b!283196 m!298183))

(declare-fun m!298185 () Bool)

(assert (=> b!283197 m!298185))

(assert (=> b!283099 d!65335))

(declare-fun d!65337 () Bool)

(declare-fun e!179672 () Bool)

(assert (=> d!65337 e!179672))

(declare-fun res!146220 () Bool)

(assert (=> d!65337 (=> (not res!146220) (not e!179672))))

(assert (=> d!65337 (= res!146220 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7058 a!3325))))))

(declare-fun lt!140007 () Unit!8988)

(declare-fun choose!41 (array!14129 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4427) Unit!8988)

(assert (=> d!65337 (= lt!140007 (choose!41 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4424))))

(assert (=> d!65337 (bvslt (size!7058 a!3325) #b01111111111111111111111111111111)))

(assert (=> d!65337 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4424) lt!140007)))

(declare-fun b!283201 () Bool)

(assert (=> b!283201 (= e!179672 (arrayNoDuplicates!0 (array!14130 (store (arr!6706 a!3325) i!1267 k0!2581) (size!7058 a!3325)) #b00000000000000000000000000000000 Nil!4424))))

(assert (= (and d!65337 res!146220) b!283201))

(declare-fun m!298187 () Bool)

(assert (=> d!65337 m!298187))

(assert (=> b!283201 m!298035))

(declare-fun m!298189 () Bool)

(assert (=> b!283201 m!298189))

(assert (=> b!283099 d!65337))

(declare-fun d!65339 () Bool)

(assert (=> d!65339 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!140010 () Unit!8988)

(declare-fun choose!38 (array!14129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8988)

(assert (=> d!65339 (= lt!140010 (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> d!65339 (validMask!0 mask!3868)))

(assert (=> d!65339 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) lt!140010)))

(declare-fun bs!10081 () Bool)

(assert (= bs!10081 d!65339))

(assert (=> bs!10081 m!298037))

(declare-fun m!298191 () Bool)

(assert (=> bs!10081 m!298191))

(assert (=> bs!10081 m!298051))

(assert (=> b!283099 d!65339))

(declare-fun b!283226 () Bool)

(declare-fun e!179692 () Bool)

(declare-fun call!25454 () Bool)

(assert (=> b!283226 (= e!179692 call!25454)))

(declare-fun d!65345 () Bool)

(declare-fun res!146233 () Bool)

(declare-fun e!179691 () Bool)

(assert (=> d!65345 (=> res!146233 e!179691)))

(assert (=> d!65345 (= res!146233 (bvsge startIndex!26 (size!7058 a!3325)))))

(assert (=> d!65345 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868) e!179691)))

(declare-fun b!283227 () Bool)

(assert (=> b!283227 (= e!179691 e!179692)))

(declare-fun c!46049 () Bool)

(assert (=> b!283227 (= c!46049 (validKeyInArray!0 (select (arr!6706 a!3325) startIndex!26)))))

(declare-fun bm!25451 () Bool)

(assert (=> bm!25451 (= call!25454 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283228 () Bool)

(declare-fun e!179693 () Bool)

(assert (=> b!283228 (= e!179692 e!179693)))

(declare-fun lt!140031 () (_ BitVec 64))

(assert (=> b!283228 (= lt!140031 (select (arr!6706 a!3325) startIndex!26))))

(declare-fun lt!140029 () Unit!8988)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14129 (_ BitVec 64) (_ BitVec 32)) Unit!8988)

(assert (=> b!283228 (= lt!140029 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140031 startIndex!26))))

(assert (=> b!283228 (arrayContainsKey!0 a!3325 lt!140031 #b00000000000000000000000000000000)))

(declare-fun lt!140030 () Unit!8988)

(assert (=> b!283228 (= lt!140030 lt!140029)))

(declare-fun res!146234 () Bool)

(assert (=> b!283228 (= res!146234 (= (seekEntryOrOpen!0 (select (arr!6706 a!3325) startIndex!26) a!3325 mask!3868) (Found!1829 startIndex!26)))))

(assert (=> b!283228 (=> (not res!146234) (not e!179693))))

(declare-fun b!283229 () Bool)

(assert (=> b!283229 (= e!179693 call!25454)))

(assert (= (and d!65345 (not res!146233)) b!283227))

(assert (= (and b!283227 c!46049) b!283228))

(assert (= (and b!283227 (not c!46049)) b!283226))

(assert (= (and b!283228 res!146234) b!283229))

(assert (= (or b!283229 b!283226) bm!25451))

(assert (=> b!283227 m!298039))

(assert (=> b!283227 m!298039))

(assert (=> b!283227 m!298049))

(declare-fun m!298217 () Bool)

(assert (=> bm!25451 m!298217))

(assert (=> b!283228 m!298039))

(declare-fun m!298219 () Bool)

(assert (=> b!283228 m!298219))

(declare-fun m!298221 () Bool)

(assert (=> b!283228 m!298221))

(assert (=> b!283228 m!298039))

(assert (=> b!283228 m!298045))

(assert (=> b!283099 d!65345))

(declare-fun bm!25454 () Bool)

(declare-fun call!25457 () Bool)

(declare-fun c!46052 () Bool)

(assert (=> bm!25454 (= call!25457 (arrayNoDuplicates!0 lt!139949 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46052 (Cons!4423 (select (arr!6706 lt!139949) #b00000000000000000000000000000000) Nil!4424) Nil!4424)))))

(declare-fun d!65359 () Bool)

(declare-fun res!146244 () Bool)

(declare-fun e!179706 () Bool)

(assert (=> d!65359 (=> res!146244 e!179706)))

(assert (=> d!65359 (= res!146244 (bvsge #b00000000000000000000000000000000 (size!7058 lt!139949)))))

(assert (=> d!65359 (= (arrayNoDuplicates!0 lt!139949 #b00000000000000000000000000000000 Nil!4424) e!179706)))

(declare-fun b!283243 () Bool)

(declare-fun e!179705 () Bool)

(declare-fun e!179707 () Bool)

(assert (=> b!283243 (= e!179705 e!179707)))

(assert (=> b!283243 (= c!46052 (validKeyInArray!0 (select (arr!6706 lt!139949) #b00000000000000000000000000000000)))))

(declare-fun b!283244 () Bool)

(assert (=> b!283244 (= e!179707 call!25457)))

(declare-fun b!283245 () Bool)

(assert (=> b!283245 (= e!179707 call!25457)))

(declare-fun b!283246 () Bool)

(assert (=> b!283246 (= e!179706 e!179705)))

(declare-fun res!146246 () Bool)

(assert (=> b!283246 (=> (not res!146246) (not e!179705))))

(declare-fun e!179708 () Bool)

(assert (=> b!283246 (= res!146246 (not e!179708))))

(declare-fun res!146245 () Bool)

(assert (=> b!283246 (=> (not res!146245) (not e!179708))))

(assert (=> b!283246 (= res!146245 (validKeyInArray!0 (select (arr!6706 lt!139949) #b00000000000000000000000000000000)))))

(declare-fun b!283247 () Bool)

(declare-fun contains!1965 (List!4427 (_ BitVec 64)) Bool)

(assert (=> b!283247 (= e!179708 (contains!1965 Nil!4424 (select (arr!6706 lt!139949) #b00000000000000000000000000000000)))))

(assert (= (and d!65359 (not res!146244)) b!283246))

(assert (= (and b!283246 res!146245) b!283247))

(assert (= (and b!283246 res!146246) b!283243))

(assert (= (and b!283243 c!46052) b!283245))

(assert (= (and b!283243 (not c!46052)) b!283244))

(assert (= (or b!283245 b!283244) bm!25454))

(declare-fun m!298227 () Bool)

(assert (=> bm!25454 m!298227))

(declare-fun m!298229 () Bool)

(assert (=> bm!25454 m!298229))

(assert (=> b!283243 m!298227))

(assert (=> b!283243 m!298227))

(declare-fun m!298231 () Bool)

(assert (=> b!283243 m!298231))

(assert (=> b!283246 m!298227))

(assert (=> b!283246 m!298227))

(assert (=> b!283246 m!298231))

(assert (=> b!283247 m!298227))

(assert (=> b!283247 m!298227))

(declare-fun m!298233 () Bool)

(assert (=> b!283247 m!298233))

(assert (=> b!283099 d!65359))

(declare-fun d!65363 () Bool)

(assert (=> d!65363 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283104 d!65363))

(declare-fun b!283248 () Bool)

(declare-fun e!179710 () Bool)

(declare-fun call!25458 () Bool)

(assert (=> b!283248 (= e!179710 call!25458)))

(declare-fun d!65365 () Bool)

(declare-fun res!146247 () Bool)

(declare-fun e!179709 () Bool)

(assert (=> d!65365 (=> res!146247 e!179709)))

(assert (=> d!65365 (= res!146247 (bvsge #b00000000000000000000000000000000 (size!7058 a!3325)))))

(assert (=> d!65365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!179709)))

(declare-fun b!283249 () Bool)

(assert (=> b!283249 (= e!179709 e!179710)))

(declare-fun c!46053 () Bool)

(assert (=> b!283249 (= c!46053 (validKeyInArray!0 (select (arr!6706 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25455 () Bool)

(assert (=> bm!25455 (= call!25458 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283250 () Bool)

(declare-fun e!179711 () Bool)

(assert (=> b!283250 (= e!179710 e!179711)))

(declare-fun lt!140037 () (_ BitVec 64))

(assert (=> b!283250 (= lt!140037 (select (arr!6706 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140035 () Unit!8988)

(assert (=> b!283250 (= lt!140035 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140037 #b00000000000000000000000000000000))))

(assert (=> b!283250 (arrayContainsKey!0 a!3325 lt!140037 #b00000000000000000000000000000000)))

(declare-fun lt!140036 () Unit!8988)

(assert (=> b!283250 (= lt!140036 lt!140035)))

(declare-fun res!146248 () Bool)

(assert (=> b!283250 (= res!146248 (= (seekEntryOrOpen!0 (select (arr!6706 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1829 #b00000000000000000000000000000000)))))

(assert (=> b!283250 (=> (not res!146248) (not e!179711))))

(declare-fun b!283251 () Bool)

(assert (=> b!283251 (= e!179711 call!25458)))

(assert (= (and d!65365 (not res!146247)) b!283249))

(assert (= (and b!283249 c!46053) b!283250))

(assert (= (and b!283249 (not c!46053)) b!283248))

(assert (= (and b!283250 res!146248) b!283251))

(assert (= (or b!283251 b!283248) bm!25455))

(declare-fun m!298235 () Bool)

(assert (=> b!283249 m!298235))

(assert (=> b!283249 m!298235))

(declare-fun m!298237 () Bool)

(assert (=> b!283249 m!298237))

(declare-fun m!298239 () Bool)

(assert (=> bm!25455 m!298239))

(assert (=> b!283250 m!298235))

(declare-fun m!298241 () Bool)

(assert (=> b!283250 m!298241))

(declare-fun m!298243 () Bool)

(assert (=> b!283250 m!298243))

(assert (=> b!283250 m!298235))

(declare-fun m!298245 () Bool)

(assert (=> b!283250 m!298245))

(assert (=> b!283105 d!65365))

(declare-fun bm!25456 () Bool)

(declare-fun call!25459 () Bool)

(declare-fun c!46054 () Bool)

(assert (=> bm!25456 (= call!25459 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46054 (Cons!4423 (select (arr!6706 a!3325) #b00000000000000000000000000000000) Nil!4424) Nil!4424)))))

(declare-fun d!65367 () Bool)

(declare-fun res!146249 () Bool)

(declare-fun e!179713 () Bool)

(assert (=> d!65367 (=> res!146249 e!179713)))

(assert (=> d!65367 (= res!146249 (bvsge #b00000000000000000000000000000000 (size!7058 a!3325)))))

(assert (=> d!65367 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4424) e!179713)))

(declare-fun b!283252 () Bool)

(declare-fun e!179712 () Bool)

(declare-fun e!179714 () Bool)

(assert (=> b!283252 (= e!179712 e!179714)))

(assert (=> b!283252 (= c!46054 (validKeyInArray!0 (select (arr!6706 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283253 () Bool)

(assert (=> b!283253 (= e!179714 call!25459)))

(declare-fun b!283254 () Bool)

(assert (=> b!283254 (= e!179714 call!25459)))

(declare-fun b!283255 () Bool)

(assert (=> b!283255 (= e!179713 e!179712)))

(declare-fun res!146251 () Bool)

(assert (=> b!283255 (=> (not res!146251) (not e!179712))))

(declare-fun e!179715 () Bool)

(assert (=> b!283255 (= res!146251 (not e!179715))))

(declare-fun res!146250 () Bool)

(assert (=> b!283255 (=> (not res!146250) (not e!179715))))

(assert (=> b!283255 (= res!146250 (validKeyInArray!0 (select (arr!6706 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283256 () Bool)

(assert (=> b!283256 (= e!179715 (contains!1965 Nil!4424 (select (arr!6706 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65367 (not res!146249)) b!283255))

(assert (= (and b!283255 res!146250) b!283256))

(assert (= (and b!283255 res!146251) b!283252))

(assert (= (and b!283252 c!46054) b!283254))

(assert (= (and b!283252 (not c!46054)) b!283253))

(assert (= (or b!283254 b!283253) bm!25456))

(assert (=> bm!25456 m!298235))

(declare-fun m!298247 () Bool)

(assert (=> bm!25456 m!298247))

(assert (=> b!283252 m!298235))

(assert (=> b!283252 m!298235))

(assert (=> b!283252 m!298237))

(assert (=> b!283255 m!298235))

(assert (=> b!283255 m!298235))

(assert (=> b!283255 m!298237))

(assert (=> b!283256 m!298235))

(assert (=> b!283256 m!298235))

(declare-fun m!298249 () Bool)

(assert (=> b!283256 m!298249))

(assert (=> b!283102 d!65367))

(declare-fun d!65369 () Bool)

(assert (=> d!65369 (= (validKeyInArray!0 (select (arr!6706 a!3325) startIndex!26)) (and (not (= (select (arr!6706 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6706 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283096 d!65369))

(declare-fun b!283257 () Bool)

(declare-fun e!179717 () Bool)

(declare-fun call!25460 () Bool)

(assert (=> b!283257 (= e!179717 call!25460)))

(declare-fun d!65371 () Bool)

(declare-fun res!146252 () Bool)

(declare-fun e!179716 () Bool)

(assert (=> d!65371 (=> res!146252 e!179716)))

(assert (=> d!65371 (= res!146252 (bvsge startIndex!26 (size!7058 lt!139949)))))

(assert (=> d!65371 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139949 mask!3868) e!179716)))

(declare-fun b!283258 () Bool)

(assert (=> b!283258 (= e!179716 e!179717)))

(declare-fun c!46055 () Bool)

(assert (=> b!283258 (= c!46055 (validKeyInArray!0 (select (arr!6706 lt!139949) startIndex!26)))))

(declare-fun bm!25457 () Bool)

(assert (=> bm!25457 (= call!25460 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!139949 mask!3868))))

(declare-fun b!283259 () Bool)

(declare-fun e!179718 () Bool)

(assert (=> b!283259 (= e!179717 e!179718)))

(declare-fun lt!140040 () (_ BitVec 64))

(assert (=> b!283259 (= lt!140040 (select (arr!6706 lt!139949) startIndex!26))))

(declare-fun lt!140038 () Unit!8988)

(assert (=> b!283259 (= lt!140038 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139949 lt!140040 startIndex!26))))

(assert (=> b!283259 (arrayContainsKey!0 lt!139949 lt!140040 #b00000000000000000000000000000000)))

(declare-fun lt!140039 () Unit!8988)

(assert (=> b!283259 (= lt!140039 lt!140038)))

(declare-fun res!146253 () Bool)

(assert (=> b!283259 (= res!146253 (= (seekEntryOrOpen!0 (select (arr!6706 lt!139949) startIndex!26) lt!139949 mask!3868) (Found!1829 startIndex!26)))))

(assert (=> b!283259 (=> (not res!146253) (not e!179718))))

(declare-fun b!283260 () Bool)

(assert (=> b!283260 (= e!179718 call!25460)))

(assert (= (and d!65371 (not res!146252)) b!283258))

(assert (= (and b!283258 c!46055) b!283259))

(assert (= (and b!283258 (not c!46055)) b!283257))

(assert (= (and b!283259 res!146253) b!283260))

(assert (= (or b!283260 b!283257) bm!25457))

(declare-fun m!298251 () Bool)

(assert (=> b!283258 m!298251))

(assert (=> b!283258 m!298251))

(declare-fun m!298253 () Bool)

(assert (=> b!283258 m!298253))

(declare-fun m!298255 () Bool)

(assert (=> bm!25457 m!298255))

(assert (=> b!283259 m!298251))

(declare-fun m!298257 () Bool)

(assert (=> b!283259 m!298257))

(declare-fun m!298259 () Bool)

(assert (=> b!283259 m!298259))

(assert (=> b!283259 m!298251))

(declare-fun m!298261 () Bool)

(assert (=> b!283259 m!298261))

(assert (=> b!283101 d!65371))

(declare-fun b!283261 () Bool)

(declare-fun e!179720 () Bool)

(declare-fun call!25461 () Bool)

(assert (=> b!283261 (= e!179720 call!25461)))

(declare-fun d!65373 () Bool)

(declare-fun res!146254 () Bool)

(declare-fun e!179719 () Bool)

(assert (=> d!65373 (=> res!146254 e!179719)))

(assert (=> d!65373 (= res!146254 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!7058 lt!139949)))))

(assert (=> d!65373 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139949 mask!3868) e!179719)))

(declare-fun b!283262 () Bool)

(assert (=> b!283262 (= e!179719 e!179720)))

(declare-fun c!46056 () Bool)

(assert (=> b!283262 (= c!46056 (validKeyInArray!0 (select (arr!6706 lt!139949) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun bm!25458 () Bool)

(assert (=> bm!25458 (= call!25461 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!139949 mask!3868))))

(declare-fun b!283263 () Bool)

(declare-fun e!179721 () Bool)

(assert (=> b!283263 (= e!179720 e!179721)))

(declare-fun lt!140043 () (_ BitVec 64))

(assert (=> b!283263 (= lt!140043 (select (arr!6706 lt!139949) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!140041 () Unit!8988)

(assert (=> b!283263 (= lt!140041 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139949 lt!140043 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!283263 (arrayContainsKey!0 lt!139949 lt!140043 #b00000000000000000000000000000000)))

(declare-fun lt!140042 () Unit!8988)

(assert (=> b!283263 (= lt!140042 lt!140041)))

(declare-fun res!146255 () Bool)

(assert (=> b!283263 (= res!146255 (= (seekEntryOrOpen!0 (select (arr!6706 lt!139949) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!139949 mask!3868) (Found!1829 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!283263 (=> (not res!146255) (not e!179721))))

(declare-fun b!283264 () Bool)

(assert (=> b!283264 (= e!179721 call!25461)))

(assert (= (and d!65373 (not res!146254)) b!283262))

(assert (= (and b!283262 c!46056) b!283263))

(assert (= (and b!283262 (not c!46056)) b!283261))

(assert (= (and b!283263 res!146255) b!283264))

(assert (= (or b!283264 b!283261) bm!25458))

(declare-fun m!298263 () Bool)

(assert (=> b!283262 m!298263))

(assert (=> b!283262 m!298263))

(declare-fun m!298265 () Bool)

(assert (=> b!283262 m!298265))

(declare-fun m!298267 () Bool)

(assert (=> bm!25458 m!298267))

(assert (=> b!283263 m!298263))

(declare-fun m!298269 () Bool)

(assert (=> b!283263 m!298269))

(declare-fun m!298271 () Bool)

(assert (=> b!283263 m!298271))

(assert (=> b!283263 m!298263))

(declare-fun m!298273 () Bool)

(assert (=> b!283263 m!298273))

(assert (=> b!283101 d!65373))

(declare-fun d!65375 () Bool)

(declare-fun e!179727 () Bool)

(assert (=> d!65375 e!179727))

(declare-fun res!146261 () Bool)

(assert (=> d!65375 (=> (not res!146261) (not e!179727))))

(assert (=> d!65375 (= res!146261 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7058 a!3325))))))

(declare-fun lt!140049 () Unit!8988)

(declare-fun choose!98 (array!14129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8988)

(assert (=> d!65375 (= lt!140049 (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!65375 (validMask!0 mask!3868)))

(assert (=> d!65375 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!140049)))

(declare-fun b!283270 () Bool)

(assert (=> b!283270 (= e!179727 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14130 (store (arr!6706 a!3325) i!1267 k0!2581) (size!7058 a!3325)) mask!3868))))

(assert (= (and d!65375 res!146261) b!283270))

(declare-fun m!298279 () Bool)

(assert (=> d!65375 m!298279))

(assert (=> d!65375 m!298051))

(assert (=> b!283270 m!298035))

(declare-fun m!298281 () Bool)

(assert (=> b!283270 m!298281))

(assert (=> b!283101 d!65375))

(declare-fun d!65379 () Bool)

(declare-fun res!146266 () Bool)

(declare-fun e!179732 () Bool)

(assert (=> d!65379 (=> res!146266 e!179732)))

(assert (=> d!65379 (= res!146266 (= (select (arr!6706 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65379 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!179732)))

(declare-fun b!283275 () Bool)

(declare-fun e!179733 () Bool)

(assert (=> b!283275 (= e!179732 e!179733)))

(declare-fun res!146267 () Bool)

(assert (=> b!283275 (=> (not res!146267) (not e!179733))))

(assert (=> b!283275 (= res!146267 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7058 a!3325)))))

(declare-fun b!283276 () Bool)

(assert (=> b!283276 (= e!179733 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65379 (not res!146266)) b!283275))

(assert (= (and b!283275 res!146267) b!283276))

(assert (=> d!65379 m!298235))

(declare-fun m!298283 () Bool)

(assert (=> b!283276 m!298283))

(assert (=> b!283098 d!65379))

(declare-fun d!65381 () Bool)

(assert (=> d!65381 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27312 d!65381))

(declare-fun d!65385 () Bool)

(assert (=> d!65385 (= (array_inv!4656 a!3325) (bvsge (size!7058 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27312 d!65385))

(declare-fun b!283295 () Bool)

(declare-fun e!179744 () SeekEntryResult!1829)

(declare-fun lt!140061 () SeekEntryResult!1829)

(assert (=> b!283295 (= e!179744 (Found!1829 (index!9488 lt!140061)))))

(declare-fun b!283296 () Bool)

(declare-fun e!179743 () SeekEntryResult!1829)

(assert (=> b!283296 (= e!179743 Undefined!1829)))

(declare-fun d!65387 () Bool)

(declare-fun lt!140063 () SeekEntryResult!1829)

(assert (=> d!65387 (and (or ((_ is Undefined!1829) lt!140063) (not ((_ is Found!1829) lt!140063)) (and (bvsge (index!9487 lt!140063) #b00000000000000000000000000000000) (bvslt (index!9487 lt!140063) (size!7058 a!3325)))) (or ((_ is Undefined!1829) lt!140063) ((_ is Found!1829) lt!140063) (not ((_ is MissingZero!1829) lt!140063)) (and (bvsge (index!9486 lt!140063) #b00000000000000000000000000000000) (bvslt (index!9486 lt!140063) (size!7058 a!3325)))) (or ((_ is Undefined!1829) lt!140063) ((_ is Found!1829) lt!140063) ((_ is MissingZero!1829) lt!140063) (not ((_ is MissingVacant!1829) lt!140063)) (and (bvsge (index!9489 lt!140063) #b00000000000000000000000000000000) (bvslt (index!9489 lt!140063) (size!7058 a!3325)))) (or ((_ is Undefined!1829) lt!140063) (ite ((_ is Found!1829) lt!140063) (= (select (arr!6706 a!3325) (index!9487 lt!140063)) k0!2581) (ite ((_ is MissingZero!1829) lt!140063) (= (select (arr!6706 a!3325) (index!9486 lt!140063)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1829) lt!140063) (= (select (arr!6706 a!3325) (index!9489 lt!140063)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65387 (= lt!140063 e!179743)))

(declare-fun c!46068 () Bool)

(assert (=> d!65387 (= c!46068 (and ((_ is Intermediate!1829) lt!140061) (undefined!2641 lt!140061)))))

(assert (=> d!65387 (= lt!140061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65387 (validMask!0 mask!3868)))

(assert (=> d!65387 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!140063)))

(declare-fun b!283297 () Bool)

(declare-fun c!46067 () Bool)

(declare-fun lt!140062 () (_ BitVec 64))

(assert (=> b!283297 (= c!46067 (= lt!140062 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179747 () SeekEntryResult!1829)

(assert (=> b!283297 (= e!179744 e!179747)))

(declare-fun b!283298 () Bool)

(assert (=> b!283298 (= e!179747 (seekKeyOrZeroReturnVacant!0 (x!27803 lt!140061) (index!9488 lt!140061) (index!9488 lt!140061) k0!2581 a!3325 mask!3868))))

(declare-fun b!283299 () Bool)

(assert (=> b!283299 (= e!179743 e!179744)))

(assert (=> b!283299 (= lt!140062 (select (arr!6706 a!3325) (index!9488 lt!140061)))))

(declare-fun c!46066 () Bool)

(assert (=> b!283299 (= c!46066 (= lt!140062 k0!2581))))

(declare-fun b!283300 () Bool)

(assert (=> b!283300 (= e!179747 (MissingZero!1829 (index!9488 lt!140061)))))

(assert (= (and d!65387 c!46068) b!283296))

(assert (= (and d!65387 (not c!46068)) b!283299))

(assert (= (and b!283299 c!46066) b!283295))

(assert (= (and b!283299 (not c!46066)) b!283297))

(assert (= (and b!283297 c!46067) b!283300))

(assert (= (and b!283297 (not c!46067)) b!283298))

(assert (=> d!65387 m!298051))

(declare-fun m!298299 () Bool)

(assert (=> d!65387 m!298299))

(declare-fun m!298301 () Bool)

(assert (=> d!65387 m!298301))

(declare-fun m!298303 () Bool)

(assert (=> d!65387 m!298303))

(assert (=> d!65387 m!298301))

(declare-fun m!298305 () Bool)

(assert (=> d!65387 m!298305))

(declare-fun m!298307 () Bool)

(assert (=> d!65387 m!298307))

(declare-fun m!298309 () Bool)

(assert (=> b!283298 m!298309))

(declare-fun m!298311 () Bool)

(assert (=> b!283299 m!298311))

(assert (=> b!283097 d!65387))

(check-sat (not b!283255) (not d!65337) (not b!283262) (not d!65339) (not b!283246) (not d!65327) (not b!283249) (not b!283243) (not b!283259) (not bm!25457) (not bm!25458) (not b!283258) (not bm!25451) (not d!65387) (not b!283201) (not b!283270) (not b!283263) (not b!283276) (not bm!25455) (not d!65375) (not b!283192) (not bm!25454) (not b!283252) (not b!283196) (not b!283298) (not b!283227) (not d!65335) (not b!283181) (not b!283250) (not b!283256) (not b!283228) (not bm!25456) (not b!283247) (not d!65325))
(check-sat)
