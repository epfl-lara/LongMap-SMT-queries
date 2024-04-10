; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27316 () Bool)

(assert start!27316)

(declare-fun b!283109 () Bool)

(declare-fun e!179620 () Bool)

(declare-fun e!179623 () Bool)

(assert (=> b!283109 (= e!179620 (not e!179623))))

(declare-fun res!146185 () Bool)

(assert (=> b!283109 (=> res!146185 e!179623)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14134 0))(
  ( (array!14135 (arr!6709 (Array (_ BitVec 32) (_ BitVec 64))) (size!7061 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14134)

(assert (=> b!283109 (= res!146185 (or (bvsge startIndex!26 (bvsub (size!7061 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14134 (_ BitVec 32)) Bool)

(assert (=> b!283109 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9018 0))(
  ( (Unit!9019) )
))
(declare-fun lt!139926 () Unit!9018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9018)

(assert (=> b!283109 (= lt!139926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139929 () array!14134)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1867 0))(
  ( (MissingZero!1867 (index!9638 (_ BitVec 32))) (Found!1867 (index!9639 (_ BitVec 32))) (Intermediate!1867 (undefined!2679 Bool) (index!9640 (_ BitVec 32)) (x!27841 (_ BitVec 32))) (Undefined!1867) (MissingVacant!1867 (index!9641 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14134 (_ BitVec 32)) SeekEntryResult!1867)

(assert (=> b!283109 (= (seekEntryOrOpen!0 (select (arr!6709 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6709 a!3325) i!1267 k!2581) startIndex!26) lt!139929 mask!3868))))

(declare-fun lt!139925 () Unit!9018)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14134 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9018)

(assert (=> b!283109 (= lt!139925 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4517 0))(
  ( (Nil!4514) (Cons!4513 (h!5183 (_ BitVec 64)) (t!9599 List!4517)) )
))
(declare-fun arrayNoDuplicates!0 (array!14134 (_ BitVec 32) List!4517) Bool)

(assert (=> b!283109 (arrayNoDuplicates!0 lt!139929 #b00000000000000000000000000000000 Nil!4514)))

(declare-fun lt!139930 () Unit!9018)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14134 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4517) Unit!9018)

(assert (=> b!283109 (= lt!139930 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4514))))

(declare-fun b!283110 () Bool)

(declare-fun res!146182 () Bool)

(assert (=> b!283110 (=> (not res!146182) (not e!179620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283110 (= res!146182 (validKeyInArray!0 (select (arr!6709 a!3325) startIndex!26)))))

(declare-fun b!283111 () Bool)

(declare-fun res!146184 () Bool)

(declare-fun e!179621 () Bool)

(assert (=> b!283111 (=> (not res!146184) (not e!179621))))

(assert (=> b!283111 (= res!146184 (validKeyInArray!0 k!2581))))

(declare-fun b!283112 () Bool)

(declare-fun res!146183 () Bool)

(assert (=> b!283112 (=> (not res!146183) (not e!179621))))

(declare-fun arrayContainsKey!0 (array!14134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283112 (= res!146183 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283114 () Bool)

(declare-fun res!146187 () Bool)

(declare-fun e!179624 () Bool)

(assert (=> b!283114 (=> (not res!146187) (not e!179624))))

(assert (=> b!283114 (= res!146187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283115 () Bool)

(declare-fun res!146181 () Bool)

(assert (=> b!283115 (=> (not res!146181) (not e!179621))))

(assert (=> b!283115 (= res!146181 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4514))))

(declare-fun b!283116 () Bool)

(declare-fun res!146186 () Bool)

(assert (=> b!283116 (=> (not res!146186) (not e!179621))))

(assert (=> b!283116 (= res!146186 (and (= (size!7061 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7061 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7061 a!3325))))))

(declare-fun b!283117 () Bool)

(assert (=> b!283117 (= e!179621 e!179624)))

(declare-fun res!146179 () Bool)

(assert (=> b!283117 (=> (not res!146179) (not e!179624))))

(declare-fun lt!139928 () SeekEntryResult!1867)

(assert (=> b!283117 (= res!146179 (or (= lt!139928 (MissingZero!1867 i!1267)) (= lt!139928 (MissingVacant!1867 i!1267))))))

(assert (=> b!283117 (= lt!139928 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!283118 () Bool)

(assert (=> b!283118 (= e!179624 e!179620)))

(declare-fun res!146178 () Bool)

(assert (=> b!283118 (=> (not res!146178) (not e!179620))))

(assert (=> b!283118 (= res!146178 (not (= startIndex!26 i!1267)))))

(assert (=> b!283118 (= lt!139929 (array!14135 (store (arr!6709 a!3325) i!1267 k!2581) (size!7061 a!3325)))))

(declare-fun b!283113 () Bool)

(assert (=> b!283113 (= e!179623 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139929 mask!3868))))

(assert (=> b!283113 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139929 mask!3868)))

(declare-fun lt!139927 () Unit!9018)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14134 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9018)

(assert (=> b!283113 (= lt!139927 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun res!146180 () Bool)

(assert (=> start!27316 (=> (not res!146180) (not e!179621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27316 (= res!146180 (validMask!0 mask!3868))))

(assert (=> start!27316 e!179621))

(declare-fun array_inv!4672 (array!14134) Bool)

(assert (=> start!27316 (array_inv!4672 a!3325)))

(assert (=> start!27316 true))

(assert (= (and start!27316 res!146180) b!283116))

(assert (= (and b!283116 res!146186) b!283111))

(assert (= (and b!283111 res!146184) b!283115))

(assert (= (and b!283115 res!146181) b!283112))

(assert (= (and b!283112 res!146183) b!283117))

(assert (= (and b!283117 res!146179) b!283114))

(assert (= (and b!283114 res!146187) b!283118))

(assert (= (and b!283118 res!146178) b!283110))

(assert (= (and b!283110 res!146182) b!283109))

(assert (= (and b!283109 (not res!146185)) b!283113))

(declare-fun m!297903 () Bool)

(assert (=> b!283111 m!297903))

(declare-fun m!297905 () Bool)

(assert (=> b!283118 m!297905))

(declare-fun m!297907 () Bool)

(assert (=> b!283112 m!297907))

(declare-fun m!297909 () Bool)

(assert (=> start!27316 m!297909))

(declare-fun m!297911 () Bool)

(assert (=> start!27316 m!297911))

(declare-fun m!297913 () Bool)

(assert (=> b!283110 m!297913))

(assert (=> b!283110 m!297913))

(declare-fun m!297915 () Bool)

(assert (=> b!283110 m!297915))

(declare-fun m!297917 () Bool)

(assert (=> b!283115 m!297917))

(declare-fun m!297919 () Bool)

(assert (=> b!283117 m!297919))

(declare-fun m!297921 () Bool)

(assert (=> b!283114 m!297921))

(declare-fun m!297923 () Bool)

(assert (=> b!283109 m!297923))

(assert (=> b!283109 m!297923))

(declare-fun m!297925 () Bool)

(assert (=> b!283109 m!297925))

(assert (=> b!283109 m!297905))

(declare-fun m!297927 () Bool)

(assert (=> b!283109 m!297927))

(assert (=> b!283109 m!297913))

(declare-fun m!297929 () Bool)

(assert (=> b!283109 m!297929))

(declare-fun m!297931 () Bool)

(assert (=> b!283109 m!297931))

(assert (=> b!283109 m!297913))

(declare-fun m!297933 () Bool)

(assert (=> b!283109 m!297933))

(declare-fun m!297935 () Bool)

(assert (=> b!283109 m!297935))

(declare-fun m!297937 () Bool)

(assert (=> b!283109 m!297937))

(declare-fun m!297939 () Bool)

(assert (=> b!283113 m!297939))

(declare-fun m!297941 () Bool)

(assert (=> b!283113 m!297941))

(declare-fun m!297943 () Bool)

(assert (=> b!283113 m!297943))

(push 1)

(assert (not b!283111))

(assert (not b!283115))

(assert (not b!283110))

(assert (not b!283114))

(assert (not b!283109))

(assert (not start!27316))

(assert (not b!283112))

(assert (not b!283117))

(assert (not b!283113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65269 () Bool)

(assert (=> d!65269 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283111 d!65269))

(declare-fun d!65271 () Bool)

(assert (=> d!65271 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27316 d!65271))

(declare-fun d!65275 () Bool)

(assert (=> d!65275 (= (array_inv!4672 a!3325) (bvsge (size!7061 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27316 d!65275))

(declare-fun b!283183 () Bool)

(declare-fun e!179671 () SeekEntryResult!1867)

(assert (=> b!283183 (= e!179671 Undefined!1867)))

(declare-fun d!65277 () Bool)

(declare-fun lt!139971 () SeekEntryResult!1867)

(assert (=> d!65277 (and (or (is-Undefined!1867 lt!139971) (not (is-Found!1867 lt!139971)) (and (bvsge (index!9639 lt!139971) #b00000000000000000000000000000000) (bvslt (index!9639 lt!139971) (size!7061 a!3325)))) (or (is-Undefined!1867 lt!139971) (is-Found!1867 lt!139971) (not (is-MissingZero!1867 lt!139971)) (and (bvsge (index!9638 lt!139971) #b00000000000000000000000000000000) (bvslt (index!9638 lt!139971) (size!7061 a!3325)))) (or (is-Undefined!1867 lt!139971) (is-Found!1867 lt!139971) (is-MissingZero!1867 lt!139971) (not (is-MissingVacant!1867 lt!139971)) (and (bvsge (index!9641 lt!139971) #b00000000000000000000000000000000) (bvslt (index!9641 lt!139971) (size!7061 a!3325)))) (or (is-Undefined!1867 lt!139971) (ite (is-Found!1867 lt!139971) (= (select (arr!6709 a!3325) (index!9639 lt!139971)) k!2581) (ite (is-MissingZero!1867 lt!139971) (= (select (arr!6709 a!3325) (index!9638 lt!139971)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1867 lt!139971) (= (select (arr!6709 a!3325) (index!9641 lt!139971)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65277 (= lt!139971 e!179671)))

(declare-fun c!46038 () Bool)

(declare-fun lt!139972 () SeekEntryResult!1867)

(assert (=> d!65277 (= c!46038 (and (is-Intermediate!1867 lt!139972) (undefined!2679 lt!139972)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14134 (_ BitVec 32)) SeekEntryResult!1867)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65277 (= lt!139972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65277 (validMask!0 mask!3868)))

(assert (=> d!65277 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!139971)))

(declare-fun b!283184 () Bool)

(declare-fun c!46039 () Bool)

(declare-fun lt!139970 () (_ BitVec 64))

(assert (=> b!283184 (= c!46039 (= lt!139970 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!179670 () SeekEntryResult!1867)

(declare-fun e!179672 () SeekEntryResult!1867)

(assert (=> b!283184 (= e!179670 e!179672)))

(declare-fun b!283185 () Bool)

(assert (=> b!283185 (= e!179671 e!179670)))

(assert (=> b!283185 (= lt!139970 (select (arr!6709 a!3325) (index!9640 lt!139972)))))

(declare-fun c!46037 () Bool)

(assert (=> b!283185 (= c!46037 (= lt!139970 k!2581))))

(declare-fun b!283186 () Bool)

(assert (=> b!283186 (= e!179672 (MissingZero!1867 (index!9640 lt!139972)))))

(declare-fun b!283187 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14134 (_ BitVec 32)) SeekEntryResult!1867)

(assert (=> b!283187 (= e!179672 (seekKeyOrZeroReturnVacant!0 (x!27841 lt!139972) (index!9640 lt!139972) (index!9640 lt!139972) k!2581 a!3325 mask!3868))))

(declare-fun b!283188 () Bool)

(assert (=> b!283188 (= e!179670 (Found!1867 (index!9640 lt!139972)))))

(assert (= (and d!65277 c!46038) b!283183))

(assert (= (and d!65277 (not c!46038)) b!283185))

(assert (= (and b!283185 c!46037) b!283188))

(assert (= (and b!283185 (not c!46037)) b!283184))

(assert (= (and b!283184 c!46039) b!283186))

(assert (= (and b!283184 (not c!46039)) b!283187))

(declare-fun m!297993 () Bool)

(assert (=> d!65277 m!297993))

(declare-fun m!297995 () Bool)

(assert (=> d!65277 m!297995))

(declare-fun m!297997 () Bool)

(assert (=> d!65277 m!297997))

(declare-fun m!297999 () Bool)

(assert (=> d!65277 m!297999))

(assert (=> d!65277 m!297909))

(assert (=> d!65277 m!297993))

(declare-fun m!298001 () Bool)

(assert (=> d!65277 m!298001))

(declare-fun m!298003 () Bool)

(assert (=> b!283185 m!298003))

(declare-fun m!298005 () Bool)

(assert (=> b!283187 m!298005))

(assert (=> b!283117 d!65277))

(declare-fun d!65285 () Bool)

(declare-fun res!146218 () Bool)

(declare-fun e!179680 () Bool)

(assert (=> d!65285 (=> res!146218 e!179680)))

(assert (=> d!65285 (= res!146218 (= (select (arr!6709 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65285 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!179680)))

(declare-fun b!283199 () Bool)

(declare-fun e!179681 () Bool)

(assert (=> b!283199 (= e!179680 e!179681)))

(declare-fun res!146219 () Bool)

(assert (=> b!283199 (=> (not res!146219) (not e!179681))))

(assert (=> b!283199 (= res!146219 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7061 a!3325)))))

(declare-fun b!283200 () Bool)

(assert (=> b!283200 (= e!179681 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65285 (not res!146218)) b!283199))

(assert (= (and b!283199 res!146219) b!283200))

(declare-fun m!298007 () Bool)

(assert (=> d!65285 m!298007))

(declare-fun m!298009 () Bool)

(assert (=> b!283200 m!298009))

(assert (=> b!283112 d!65285))

(declare-fun b!283242 () Bool)

(declare-fun e!179710 () Bool)

(declare-fun call!25472 () Bool)

(assert (=> b!283242 (= e!179710 call!25472)))

(declare-fun b!283243 () Bool)

(declare-fun e!179709 () Bool)

(assert (=> b!283243 (= e!179709 call!25472)))

(declare-fun b!283244 () Bool)

(declare-fun e!179711 () Bool)

(assert (=> b!283244 (= e!179711 e!179709)))

(declare-fun c!46057 () Bool)

(assert (=> b!283244 (= c!46057 (validKeyInArray!0 (select (arr!6709 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283245 () Bool)

(assert (=> b!283245 (= e!179709 e!179710)))

(declare-fun lt!140003 () (_ BitVec 64))

(assert (=> b!283245 (= lt!140003 (select (arr!6709 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140005 () Unit!9018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14134 (_ BitVec 64) (_ BitVec 32)) Unit!9018)

(assert (=> b!283245 (= lt!140005 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140003 #b00000000000000000000000000000000))))

(assert (=> b!283245 (arrayContainsKey!0 a!3325 lt!140003 #b00000000000000000000000000000000)))

(declare-fun lt!140004 () Unit!9018)

(assert (=> b!283245 (= lt!140004 lt!140005)))

(declare-fun res!146233 () Bool)

(assert (=> b!283245 (= res!146233 (= (seekEntryOrOpen!0 (select (arr!6709 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1867 #b00000000000000000000000000000000)))))

(assert (=> b!283245 (=> (not res!146233) (not e!179710))))

(declare-fun bm!25469 () Bool)

(assert (=> bm!25469 (= call!25472 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65287 () Bool)

(declare-fun res!146234 () Bool)

(assert (=> d!65287 (=> res!146234 e!179711)))

(assert (=> d!65287 (= res!146234 (bvsge #b00000000000000000000000000000000 (size!7061 a!3325)))))

(assert (=> d!65287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!179711)))

(assert (= (and d!65287 (not res!146234)) b!283244))

(assert (= (and b!283244 c!46057) b!283245))

(assert (= (and b!283244 (not c!46057)) b!283243))

(assert (= (and b!283245 res!146233) b!283242))

(assert (= (or b!283242 b!283243) bm!25469))

(assert (=> b!283244 m!298007))

(assert (=> b!283244 m!298007))

(declare-fun m!298073 () Bool)

(assert (=> b!283244 m!298073))

(assert (=> b!283245 m!298007))

(declare-fun m!298075 () Bool)

(assert (=> b!283245 m!298075))

(declare-fun m!298077 () Bool)

(assert (=> b!283245 m!298077))

(assert (=> b!283245 m!298007))

(declare-fun m!298079 () Bool)

(assert (=> b!283245 m!298079))

(declare-fun m!298081 () Bool)

(assert (=> bm!25469 m!298081))

(assert (=> b!283114 d!65287))

(declare-fun b!283256 () Bool)

(declare-fun e!179721 () Bool)

(declare-fun call!25473 () Bool)

(assert (=> b!283256 (= e!179721 call!25473)))

(declare-fun b!283257 () Bool)

(declare-fun e!179720 () Bool)

(assert (=> b!283257 (= e!179720 call!25473)))

(declare-fun b!283258 () Bool)

(declare-fun e!179722 () Bool)

(assert (=> b!283258 (= e!179722 e!179720)))

(declare-fun c!46060 () Bool)

(assert (=> b!283258 (= c!46060 (validKeyInArray!0 (select (arr!6709 lt!139929) startIndex!26)))))

(declare-fun b!283259 () Bool)

(assert (=> b!283259 (= e!179720 e!179721)))

(declare-fun lt!140006 () (_ BitVec 64))

(assert (=> b!283259 (= lt!140006 (select (arr!6709 lt!139929) startIndex!26))))

(declare-fun lt!140008 () Unit!9018)

(assert (=> b!283259 (= lt!140008 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139929 lt!140006 startIndex!26))))

(assert (=> b!283259 (arrayContainsKey!0 lt!139929 lt!140006 #b00000000000000000000000000000000)))

(declare-fun lt!140007 () Unit!9018)

(assert (=> b!283259 (= lt!140007 lt!140008)))

(declare-fun res!146241 () Bool)

(assert (=> b!283259 (= res!146241 (= (seekEntryOrOpen!0 (select (arr!6709 lt!139929) startIndex!26) lt!139929 mask!3868) (Found!1867 startIndex!26)))))

(assert (=> b!283259 (=> (not res!146241) (not e!179721))))

(declare-fun bm!25470 () Bool)

(assert (=> bm!25470 (= call!25473 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!139929 mask!3868))))

(declare-fun d!65301 () Bool)

(declare-fun res!146242 () Bool)

(assert (=> d!65301 (=> res!146242 e!179722)))

(assert (=> d!65301 (= res!146242 (bvsge startIndex!26 (size!7061 lt!139929)))))

(assert (=> d!65301 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139929 mask!3868) e!179722)))

(assert (= (and d!65301 (not res!146242)) b!283258))

(assert (= (and b!283258 c!46060) b!283259))

(assert (= (and b!283258 (not c!46060)) b!283257))

(assert (= (and b!283259 res!146241) b!283256))

(assert (= (or b!283256 b!283257) bm!25470))

(declare-fun m!298083 () Bool)

(assert (=> b!283258 m!298083))

(assert (=> b!283258 m!298083))

(declare-fun m!298085 () Bool)

(assert (=> b!283258 m!298085))

(assert (=> b!283259 m!298083))

(declare-fun m!298087 () Bool)

(assert (=> b!283259 m!298087))

(declare-fun m!298089 () Bool)

(assert (=> b!283259 m!298089))

(assert (=> b!283259 m!298083))

(declare-fun m!298091 () Bool)

(assert (=> b!283259 m!298091))

(declare-fun m!298093 () Bool)

(assert (=> bm!25470 m!298093))

(assert (=> b!283113 d!65301))

(declare-fun b!283260 () Bool)

(declare-fun e!179724 () Bool)

(declare-fun call!25476 () Bool)

(assert (=> b!283260 (= e!179724 call!25476)))

(declare-fun b!283261 () Bool)

(declare-fun e!179723 () Bool)

(assert (=> b!283261 (= e!179723 call!25476)))

(declare-fun b!283262 () Bool)

(declare-fun e!179725 () Bool)

(assert (=> b!283262 (= e!179725 e!179723)))

(declare-fun c!46061 () Bool)

(assert (=> b!283262 (= c!46061 (validKeyInArray!0 (select (arr!6709 lt!139929) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun b!283263 () Bool)

(assert (=> b!283263 (= e!179723 e!179724)))

(declare-fun lt!140009 () (_ BitVec 64))

(assert (=> b!283263 (= lt!140009 (select (arr!6709 lt!139929) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!140011 () Unit!9018)

(assert (=> b!283263 (= lt!140011 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139929 lt!140009 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!283263 (arrayContainsKey!0 lt!139929 lt!140009 #b00000000000000000000000000000000)))

(declare-fun lt!140010 () Unit!9018)

(assert (=> b!283263 (= lt!140010 lt!140011)))

(declare-fun res!146243 () Bool)

(assert (=> b!283263 (= res!146243 (= (seekEntryOrOpen!0 (select (arr!6709 lt!139929) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!139929 mask!3868) (Found!1867 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!283263 (=> (not res!146243) (not e!179724))))

(declare-fun bm!25473 () Bool)

(assert (=> bm!25473 (= call!25476 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!139929 mask!3868))))

(declare-fun d!65303 () Bool)

(declare-fun res!146244 () Bool)

(assert (=> d!65303 (=> res!146244 e!179725)))

(assert (=> d!65303 (= res!146244 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!7061 lt!139929)))))

(assert (=> d!65303 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139929 mask!3868) e!179725)))

(assert (= (and d!65303 (not res!146244)) b!283262))

(assert (= (and b!283262 c!46061) b!283263))

(assert (= (and b!283262 (not c!46061)) b!283261))

(assert (= (and b!283263 res!146243) b!283260))

(assert (= (or b!283260 b!283261) bm!25473))

(declare-fun m!298095 () Bool)

(assert (=> b!283262 m!298095))

(assert (=> b!283262 m!298095))

(declare-fun m!298097 () Bool)

(assert (=> b!283262 m!298097))

(assert (=> b!283263 m!298095))

(declare-fun m!298099 () Bool)

(assert (=> b!283263 m!298099))

(declare-fun m!298101 () Bool)

(assert (=> b!283263 m!298101))

(assert (=> b!283263 m!298095))

(declare-fun m!298103 () Bool)

(assert (=> b!283263 m!298103))

(declare-fun m!298105 () Bool)

(assert (=> bm!25473 m!298105))

(assert (=> b!283113 d!65303))

(declare-fun d!65305 () Bool)

(declare-fun e!179738 () Bool)

(assert (=> d!65305 e!179738))

(declare-fun res!146253 () Bool)

(assert (=> d!65305 (=> (not res!146253) (not e!179738))))

(assert (=> d!65305 (= res!146253 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7061 a!3325))))))

(declare-fun lt!140020 () Unit!9018)

(declare-fun choose!98 (array!14134 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9018)

(assert (=> d!65305 (= lt!140020 (choose!98 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!65305 (validMask!0 mask!3868)))

(assert (=> d!65305 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!140020)))

(declare-fun b!283280 () Bool)

(assert (=> b!283280 (= e!179738 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14135 (store (arr!6709 a!3325) i!1267 k!2581) (size!7061 a!3325)) mask!3868))))

(assert (= (and d!65305 res!146253) b!283280))

(declare-fun m!298133 () Bool)

(assert (=> d!65305 m!298133))

(assert (=> d!65305 m!297909))

(assert (=> b!283280 m!297905))

(declare-fun m!298135 () Bool)

(assert (=> b!283280 m!298135))

(assert (=> b!283113 d!65305))

(declare-fun b!283306 () Bool)

(declare-fun e!179757 () Bool)

(declare-fun e!179760 () Bool)

(assert (=> b!283306 (= e!179757 e!179760)))

(declare-fun res!146266 () Bool)

(assert (=> b!283306 (=> (not res!146266) (not e!179760))))

(declare-fun e!179759 () Bool)

(assert (=> b!283306 (= res!146266 (not e!179759))))

(declare-fun res!146267 () Bool)

(assert (=> b!283306 (=> (not res!146267) (not e!179759))))

(assert (=> b!283306 (= res!146267 (validKeyInArray!0 (select (arr!6709 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65313 () Bool)

(declare-fun res!146265 () Bool)

(assert (=> d!65313 (=> res!146265 e!179757)))

(assert (=> d!65313 (= res!146265 (bvsge #b00000000000000000000000000000000 (size!7061 a!3325)))))

(assert (=> d!65313 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4514) e!179757)))

(declare-fun b!283307 () Bool)

(declare-fun e!179758 () Bool)

(assert (=> b!283307 (= e!179760 e!179758)))

(declare-fun c!46073 () Bool)

(assert (=> b!283307 (= c!46073 (validKeyInArray!0 (select (arr!6709 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283308 () Bool)

(declare-fun contains!1992 (List!4517 (_ BitVec 64)) Bool)

(assert (=> b!283308 (= e!179759 (contains!1992 Nil!4514 (select (arr!6709 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283309 () Bool)

(declare-fun call!25482 () Bool)

(assert (=> b!283309 (= e!179758 call!25482)))

(declare-fun bm!25479 () Bool)

(assert (=> bm!25479 (= call!25482 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46073 (Cons!4513 (select (arr!6709 a!3325) #b00000000000000000000000000000000) Nil!4514) Nil!4514)))))

(declare-fun b!283310 () Bool)

(assert (=> b!283310 (= e!179758 call!25482)))

(assert (= (and d!65313 (not res!146265)) b!283306))

(assert (= (and b!283306 res!146267) b!283308))

(assert (= (and b!283306 res!146266) b!283307))

(assert (= (and b!283307 c!46073) b!283309))

(assert (= (and b!283307 (not c!46073)) b!283310))

(assert (= (or b!283309 b!283310) bm!25479))

(assert (=> b!283306 m!298007))

(assert (=> b!283306 m!298007))

(assert (=> b!283306 m!298073))

(assert (=> b!283307 m!298007))

(assert (=> b!283307 m!298007))

(assert (=> b!283307 m!298073))

(assert (=> b!283308 m!298007))

(assert (=> b!283308 m!298007))

(declare-fun m!298167 () Bool)

(assert (=> b!283308 m!298167))

(assert (=> bm!25479 m!298007))

(declare-fun m!298169 () Bool)

(assert (=> bm!25479 m!298169))

(assert (=> b!283115 d!65313))

(declare-fun d!65329 () Bool)

(assert (=> d!65329 (= (validKeyInArray!0 (select (arr!6709 a!3325) startIndex!26)) (and (not (= (select (arr!6709 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6709 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283110 d!65329))

(declare-fun d!65331 () Bool)

(declare-fun e!179769 () Bool)

(assert (=> d!65331 e!179769))

(declare-fun res!146276 () Bool)

(assert (=> d!65331 (=> (not res!146276) (not e!179769))))

(assert (=> d!65331 (= res!146276 (and (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7061 a!3325)) (and (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7061 a!3325)))) (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7061 a!3325)) (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7061 a!3325)))) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7061 a!3325))))))

(declare-fun lt!140032 () Unit!9018)

(declare-fun choose!83 (array!14134 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9018)

(assert (=> d!65331 (= lt!140032 (choose!83 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> d!65331 (validMask!0 mask!3868)))

(assert (=> d!65331 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868) lt!140032)))

(declare-fun b!283319 () Bool)

(assert (=> b!283319 (= e!179769 (= (seekEntryOrOpen!0 (select (arr!6709 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6709 a!3325) i!1267 k!2581) startIndex!26) (array!14135 (store (arr!6709 a!3325) i!1267 k!2581) (size!7061 a!3325)) mask!3868)))))

(assert (= (and d!65331 res!146276) b!283319))

(declare-fun m!298173 () Bool)

(assert (=> d!65331 m!298173))

(assert (=> d!65331 m!297909))

(assert (=> b!283319 m!297913))

(assert (=> b!283319 m!297933))

(assert (=> b!283319 m!297923))

(declare-fun m!298175 () Bool)

(assert (=> b!283319 m!298175))

(assert (=> b!283319 m!297923))

(assert (=> b!283319 m!297905))

(assert (=> b!283319 m!297913))

(assert (=> b!283109 d!65331))

(declare-fun b!283320 () Bool)

(declare-fun e!179771 () SeekEntryResult!1867)

(assert (=> b!283320 (= e!179771 Undefined!1867)))

(declare-fun d!65337 () Bool)

(declare-fun lt!140034 () SeekEntryResult!1867)

(assert (=> d!65337 (and (or (is-Undefined!1867 lt!140034) (not (is-Found!1867 lt!140034)) (and (bvsge (index!9639 lt!140034) #b00000000000000000000000000000000) (bvslt (index!9639 lt!140034) (size!7061 a!3325)))) (or (is-Undefined!1867 lt!140034) (is-Found!1867 lt!140034) (not (is-MissingZero!1867 lt!140034)) (and (bvsge (index!9638 lt!140034) #b00000000000000000000000000000000) (bvslt (index!9638 lt!140034) (size!7061 a!3325)))) (or (is-Undefined!1867 lt!140034) (is-Found!1867 lt!140034) (is-MissingZero!1867 lt!140034) (not (is-MissingVacant!1867 lt!140034)) (and (bvsge (index!9641 lt!140034) #b00000000000000000000000000000000) (bvslt (index!9641 lt!140034) (size!7061 a!3325)))) (or (is-Undefined!1867 lt!140034) (ite (is-Found!1867 lt!140034) (= (select (arr!6709 a!3325) (index!9639 lt!140034)) (select (arr!6709 a!3325) startIndex!26)) (ite (is-MissingZero!1867 lt!140034) (= (select (arr!6709 a!3325) (index!9638 lt!140034)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1867 lt!140034) (= (select (arr!6709 a!3325) (index!9641 lt!140034)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65337 (= lt!140034 e!179771)))

(declare-fun c!46075 () Bool)

(declare-fun lt!140035 () SeekEntryResult!1867)

