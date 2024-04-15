; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27314 () Bool)

(assert start!27314)

(declare-fun b!282902 () Bool)

(declare-fun e!179489 () Bool)

(declare-fun e!179490 () Bool)

(assert (=> b!282902 (= e!179489 e!179490)))

(declare-fun res!146032 () Bool)

(assert (=> b!282902 (=> (not res!146032) (not e!179490))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282902 (= res!146032 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14121 0))(
  ( (array!14122 (arr!6702 (Array (_ BitVec 32) (_ BitVec 64))) (size!7055 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14121)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139711 () array!14121)

(assert (=> b!282902 (= lt!139711 (array!14122 (store (arr!6702 a!3325) i!1267 k0!2581) (size!7055 a!3325)))))

(declare-fun b!282903 () Bool)

(declare-fun res!146026 () Bool)

(assert (=> b!282903 (=> (not res!146026) (not e!179489))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14121 (_ BitVec 32)) Bool)

(assert (=> b!282903 (= res!146026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282904 () Bool)

(declare-fun res!146028 () Bool)

(assert (=> b!282904 (=> (not res!146028) (not e!179490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282904 (= res!146028 (validKeyInArray!0 (select (arr!6702 a!3325) startIndex!26)))))

(declare-fun res!146027 () Bool)

(declare-fun e!179493 () Bool)

(assert (=> start!27314 (=> (not res!146027) (not e!179493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27314 (= res!146027 (validMask!0 mask!3868))))

(assert (=> start!27314 e!179493))

(declare-fun array_inv!4674 (array!14121) Bool)

(assert (=> start!27314 (array_inv!4674 a!3325)))

(assert (=> start!27314 true))

(declare-fun b!282905 () Bool)

(assert (=> b!282905 (= e!179493 e!179489)))

(declare-fun res!146030 () Bool)

(assert (=> b!282905 (=> (not res!146030) (not e!179489))))

(declare-datatypes ((SeekEntryResult!1859 0))(
  ( (MissingZero!1859 (index!9606 (_ BitVec 32))) (Found!1859 (index!9607 (_ BitVec 32))) (Intermediate!1859 (undefined!2671 Bool) (index!9608 (_ BitVec 32)) (x!27832 (_ BitVec 32))) (Undefined!1859) (MissingVacant!1859 (index!9609 (_ BitVec 32))) )
))
(declare-fun lt!139712 () SeekEntryResult!1859)

(assert (=> b!282905 (= res!146030 (or (= lt!139712 (MissingZero!1859 i!1267)) (= lt!139712 (MissingVacant!1859 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14121 (_ BitVec 32)) SeekEntryResult!1859)

(assert (=> b!282905 (= lt!139712 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282906 () Bool)

(declare-fun res!146029 () Bool)

(assert (=> b!282906 (=> (not res!146029) (not e!179493))))

(declare-fun arrayContainsKey!0 (array!14121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282906 (= res!146029 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282907 () Bool)

(declare-fun res!146024 () Bool)

(assert (=> b!282907 (=> (not res!146024) (not e!179493))))

(assert (=> b!282907 (= res!146024 (validKeyInArray!0 k0!2581))))

(declare-fun b!282908 () Bool)

(declare-fun res!146023 () Bool)

(assert (=> b!282908 (=> (not res!146023) (not e!179493))))

(declare-datatypes ((List!4483 0))(
  ( (Nil!4480) (Cons!4479 (h!5149 (_ BitVec 64)) (t!9556 List!4483)) )
))
(declare-fun arrayNoDuplicates!0 (array!14121 (_ BitVec 32) List!4483) Bool)

(assert (=> b!282908 (= res!146023 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4480))))

(declare-fun e!179492 () Bool)

(declare-fun b!282909 () Bool)

(assert (=> b!282909 (= e!179492 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139711 mask!3868))))

(assert (=> b!282909 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139711 mask!3868)))

(declare-datatypes ((Unit!8964 0))(
  ( (Unit!8965) )
))
(declare-fun lt!139710 () Unit!8964)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8964)

(assert (=> b!282909 (= lt!139710 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!282910 () Bool)

(declare-fun res!146025 () Bool)

(assert (=> b!282910 (=> (not res!146025) (not e!179493))))

(assert (=> b!282910 (= res!146025 (and (= (size!7055 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7055 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7055 a!3325))))))

(declare-fun b!282911 () Bool)

(assert (=> b!282911 (= e!179490 (not e!179492))))

(declare-fun res!146031 () Bool)

(assert (=> b!282911 (=> res!146031 e!179492)))

(assert (=> b!282911 (= res!146031 (or (bvsge startIndex!26 (bvsub (size!7055 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!282911 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!139708 () Unit!8964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8964)

(assert (=> b!282911 (= lt!139708 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282911 (= (seekEntryOrOpen!0 (select (arr!6702 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6702 a!3325) i!1267 k0!2581) startIndex!26) lt!139711 mask!3868))))

(declare-fun lt!139709 () Unit!8964)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8964)

(assert (=> b!282911 (= lt!139709 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282911 (arrayNoDuplicates!0 lt!139711 #b00000000000000000000000000000000 Nil!4480)))

(declare-fun lt!139713 () Unit!8964)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14121 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4483) Unit!8964)

(assert (=> b!282911 (= lt!139713 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4480))))

(assert (= (and start!27314 res!146027) b!282910))

(assert (= (and b!282910 res!146025) b!282907))

(assert (= (and b!282907 res!146024) b!282908))

(assert (= (and b!282908 res!146023) b!282906))

(assert (= (and b!282906 res!146029) b!282905))

(assert (= (and b!282905 res!146030) b!282903))

(assert (= (and b!282903 res!146026) b!282902))

(assert (= (and b!282902 res!146032) b!282904))

(assert (= (and b!282904 res!146028) b!282911))

(assert (= (and b!282911 (not res!146031)) b!282909))

(declare-fun m!297227 () Bool)

(assert (=> start!27314 m!297227))

(declare-fun m!297229 () Bool)

(assert (=> start!27314 m!297229))

(declare-fun m!297231 () Bool)

(assert (=> b!282908 m!297231))

(declare-fun m!297233 () Bool)

(assert (=> b!282903 m!297233))

(declare-fun m!297235 () Bool)

(assert (=> b!282906 m!297235))

(declare-fun m!297237 () Bool)

(assert (=> b!282905 m!297237))

(declare-fun m!297239 () Bool)

(assert (=> b!282909 m!297239))

(declare-fun m!297241 () Bool)

(assert (=> b!282909 m!297241))

(declare-fun m!297243 () Bool)

(assert (=> b!282909 m!297243))

(declare-fun m!297245 () Bool)

(assert (=> b!282907 m!297245))

(declare-fun m!297247 () Bool)

(assert (=> b!282902 m!297247))

(declare-fun m!297249 () Bool)

(assert (=> b!282911 m!297249))

(declare-fun m!297251 () Bool)

(assert (=> b!282911 m!297251))

(declare-fun m!297253 () Bool)

(assert (=> b!282911 m!297253))

(assert (=> b!282911 m!297247))

(declare-fun m!297255 () Bool)

(assert (=> b!282911 m!297255))

(declare-fun m!297257 () Bool)

(assert (=> b!282911 m!297257))

(declare-fun m!297259 () Bool)

(assert (=> b!282911 m!297259))

(declare-fun m!297261 () Bool)

(assert (=> b!282911 m!297261))

(assert (=> b!282911 m!297253))

(declare-fun m!297263 () Bool)

(assert (=> b!282911 m!297263))

(assert (=> b!282911 m!297257))

(declare-fun m!297265 () Bool)

(assert (=> b!282911 m!297265))

(assert (=> b!282904 m!297257))

(assert (=> b!282904 m!297257))

(declare-fun m!297267 () Bool)

(assert (=> b!282904 m!297267))

(check-sat (not b!282904) (not b!282911) (not b!282905) (not b!282906) (not start!27314) (not b!282908) (not b!282903) (not b!282907) (not b!282909))
(check-sat)
(get-model)

(declare-fun d!65105 () Bool)

(assert (=> d!65105 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!282907 d!65105))

(declare-fun b!282982 () Bool)

(declare-fun e!179535 () Bool)

(declare-fun e!179534 () Bool)

(assert (=> b!282982 (= e!179535 e!179534)))

(declare-fun c!45994 () Bool)

(assert (=> b!282982 (= c!45994 (validKeyInArray!0 (select (arr!6702 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!282983 () Bool)

(declare-fun call!25438 () Bool)

(assert (=> b!282983 (= e!179534 call!25438)))

(declare-fun b!282984 () Bool)

(declare-fun e!179533 () Bool)

(assert (=> b!282984 (= e!179533 e!179535)))

(declare-fun res!146099 () Bool)

(assert (=> b!282984 (=> (not res!146099) (not e!179535))))

(declare-fun e!179532 () Bool)

(assert (=> b!282984 (= res!146099 (not e!179532))))

(declare-fun res!146100 () Bool)

(assert (=> b!282984 (=> (not res!146100) (not e!179532))))

(assert (=> b!282984 (= res!146100 (validKeyInArray!0 (select (arr!6702 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!282985 () Bool)

(assert (=> b!282985 (= e!179534 call!25438)))

(declare-fun b!282986 () Bool)

(declare-fun contains!1966 (List!4483 (_ BitVec 64)) Bool)

(assert (=> b!282986 (= e!179532 (contains!1966 Nil!4480 (select (arr!6702 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65107 () Bool)

(declare-fun res!146101 () Bool)

(assert (=> d!65107 (=> res!146101 e!179533)))

(assert (=> d!65107 (= res!146101 (bvsge #b00000000000000000000000000000000 (size!7055 a!3325)))))

(assert (=> d!65107 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4480) e!179533)))

(declare-fun bm!25435 () Bool)

(assert (=> bm!25435 (= call!25438 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45994 (Cons!4479 (select (arr!6702 a!3325) #b00000000000000000000000000000000) Nil!4480) Nil!4480)))))

(assert (= (and d!65107 (not res!146101)) b!282984))

(assert (= (and b!282984 res!146100) b!282986))

(assert (= (and b!282984 res!146099) b!282982))

(assert (= (and b!282982 c!45994) b!282985))

(assert (= (and b!282982 (not c!45994)) b!282983))

(assert (= (or b!282985 b!282983) bm!25435))

(declare-fun m!297353 () Bool)

(assert (=> b!282982 m!297353))

(assert (=> b!282982 m!297353))

(declare-fun m!297355 () Bool)

(assert (=> b!282982 m!297355))

(assert (=> b!282984 m!297353))

(assert (=> b!282984 m!297353))

(assert (=> b!282984 m!297355))

(assert (=> b!282986 m!297353))

(assert (=> b!282986 m!297353))

(declare-fun m!297357 () Bool)

(assert (=> b!282986 m!297357))

(assert (=> bm!25435 m!297353))

(declare-fun m!297359 () Bool)

(assert (=> bm!25435 m!297359))

(assert (=> b!282908 d!65107))

(declare-fun d!65109 () Bool)

(declare-fun e!179538 () Bool)

(assert (=> d!65109 e!179538))

(declare-fun res!146104 () Bool)

(assert (=> d!65109 (=> (not res!146104) (not e!179538))))

(assert (=> d!65109 (= res!146104 (and (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7055 a!3325)) (and (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7055 a!3325)))) (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7055 a!3325)) (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7055 a!3325)))) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7055 a!3325))))))

(declare-fun lt!139752 () Unit!8964)

(declare-fun choose!83 (array!14121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8964)

(assert (=> d!65109 (= lt!139752 (choose!83 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> d!65109 (validMask!0 mask!3868)))

(assert (=> d!65109 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868) lt!139752)))

(declare-fun b!282989 () Bool)

(assert (=> b!282989 (= e!179538 (= (seekEntryOrOpen!0 (select (arr!6702 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6702 a!3325) i!1267 k0!2581) startIndex!26) (array!14122 (store (arr!6702 a!3325) i!1267 k0!2581) (size!7055 a!3325)) mask!3868)))))

(assert (= (and d!65109 res!146104) b!282989))

(declare-fun m!297361 () Bool)

(assert (=> d!65109 m!297361))

(assert (=> d!65109 m!297227))

(assert (=> b!282989 m!297257))

(assert (=> b!282989 m!297253))

(assert (=> b!282989 m!297253))

(declare-fun m!297363 () Bool)

(assert (=> b!282989 m!297363))

(assert (=> b!282989 m!297247))

(assert (=> b!282989 m!297257))

(assert (=> b!282989 m!297265))

(assert (=> b!282911 d!65109))

(declare-fun b!283048 () Bool)

(declare-fun e!179581 () SeekEntryResult!1859)

(declare-fun e!179582 () SeekEntryResult!1859)

(assert (=> b!283048 (= e!179581 e!179582)))

(declare-fun lt!139783 () (_ BitVec 64))

(declare-fun lt!139785 () SeekEntryResult!1859)

(assert (=> b!283048 (= lt!139783 (select (arr!6702 a!3325) (index!9608 lt!139785)))))

(declare-fun c!46013 () Bool)

(assert (=> b!283048 (= c!46013 (= lt!139783 (select (arr!6702 a!3325) startIndex!26)))))

(declare-fun d!65117 () Bool)

(declare-fun lt!139784 () SeekEntryResult!1859)

(get-info :version)

(assert (=> d!65117 (and (or ((_ is Undefined!1859) lt!139784) (not ((_ is Found!1859) lt!139784)) (and (bvsge (index!9607 lt!139784) #b00000000000000000000000000000000) (bvslt (index!9607 lt!139784) (size!7055 a!3325)))) (or ((_ is Undefined!1859) lt!139784) ((_ is Found!1859) lt!139784) (not ((_ is MissingZero!1859) lt!139784)) (and (bvsge (index!9606 lt!139784) #b00000000000000000000000000000000) (bvslt (index!9606 lt!139784) (size!7055 a!3325)))) (or ((_ is Undefined!1859) lt!139784) ((_ is Found!1859) lt!139784) ((_ is MissingZero!1859) lt!139784) (not ((_ is MissingVacant!1859) lt!139784)) (and (bvsge (index!9609 lt!139784) #b00000000000000000000000000000000) (bvslt (index!9609 lt!139784) (size!7055 a!3325)))) (or ((_ is Undefined!1859) lt!139784) (ite ((_ is Found!1859) lt!139784) (= (select (arr!6702 a!3325) (index!9607 lt!139784)) (select (arr!6702 a!3325) startIndex!26)) (ite ((_ is MissingZero!1859) lt!139784) (= (select (arr!6702 a!3325) (index!9606 lt!139784)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1859) lt!139784) (= (select (arr!6702 a!3325) (index!9609 lt!139784)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65117 (= lt!139784 e!179581)))

(declare-fun c!46012 () Bool)

(assert (=> d!65117 (= c!46012 (and ((_ is Intermediate!1859) lt!139785) (undefined!2671 lt!139785)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14121 (_ BitVec 32)) SeekEntryResult!1859)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65117 (= lt!139785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6702 a!3325) startIndex!26) mask!3868) (select (arr!6702 a!3325) startIndex!26) a!3325 mask!3868))))

(assert (=> d!65117 (validMask!0 mask!3868)))

(assert (=> d!65117 (= (seekEntryOrOpen!0 (select (arr!6702 a!3325) startIndex!26) a!3325 mask!3868) lt!139784)))

(declare-fun b!283049 () Bool)

(assert (=> b!283049 (= e!179582 (Found!1859 (index!9608 lt!139785)))))

(declare-fun b!283050 () Bool)

(declare-fun e!179583 () SeekEntryResult!1859)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14121 (_ BitVec 32)) SeekEntryResult!1859)

(assert (=> b!283050 (= e!179583 (seekKeyOrZeroReturnVacant!0 (x!27832 lt!139785) (index!9608 lt!139785) (index!9608 lt!139785) (select (arr!6702 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283051 () Bool)

(assert (=> b!283051 (= e!179581 Undefined!1859)))

(declare-fun b!283052 () Bool)

(declare-fun c!46011 () Bool)

(assert (=> b!283052 (= c!46011 (= lt!139783 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283052 (= e!179582 e!179583)))

(declare-fun b!283053 () Bool)

(assert (=> b!283053 (= e!179583 (MissingZero!1859 (index!9608 lt!139785)))))

(assert (= (and d!65117 c!46012) b!283051))

(assert (= (and d!65117 (not c!46012)) b!283048))

(assert (= (and b!283048 c!46013) b!283049))

(assert (= (and b!283048 (not c!46013)) b!283052))

(assert (= (and b!283052 c!46011) b!283053))

(assert (= (and b!283052 (not c!46011)) b!283050))

(declare-fun m!297405 () Bool)

(assert (=> b!283048 m!297405))

(declare-fun m!297407 () Bool)

(assert (=> d!65117 m!297407))

(assert (=> d!65117 m!297257))

(declare-fun m!297409 () Bool)

(assert (=> d!65117 m!297409))

(declare-fun m!297411 () Bool)

(assert (=> d!65117 m!297411))

(assert (=> d!65117 m!297409))

(assert (=> d!65117 m!297257))

(declare-fun m!297413 () Bool)

(assert (=> d!65117 m!297413))

(assert (=> d!65117 m!297227))

(declare-fun m!297415 () Bool)

(assert (=> d!65117 m!297415))

(assert (=> b!283050 m!297257))

(declare-fun m!297417 () Bool)

(assert (=> b!283050 m!297417))

(assert (=> b!282911 d!65117))

(declare-fun b!283054 () Bool)

(declare-fun e!179587 () Bool)

(declare-fun e!179586 () Bool)

(assert (=> b!283054 (= e!179587 e!179586)))

(declare-fun c!46014 () Bool)

(assert (=> b!283054 (= c!46014 (validKeyInArray!0 (select (arr!6702 lt!139711) #b00000000000000000000000000000000)))))

(declare-fun b!283055 () Bool)

(declare-fun call!25443 () Bool)

(assert (=> b!283055 (= e!179586 call!25443)))

(declare-fun b!283056 () Bool)

(declare-fun e!179585 () Bool)

(assert (=> b!283056 (= e!179585 e!179587)))

(declare-fun res!146131 () Bool)

(assert (=> b!283056 (=> (not res!146131) (not e!179587))))

(declare-fun e!179584 () Bool)

(assert (=> b!283056 (= res!146131 (not e!179584))))

(declare-fun res!146132 () Bool)

(assert (=> b!283056 (=> (not res!146132) (not e!179584))))

(assert (=> b!283056 (= res!146132 (validKeyInArray!0 (select (arr!6702 lt!139711) #b00000000000000000000000000000000)))))

(declare-fun b!283057 () Bool)

(assert (=> b!283057 (= e!179586 call!25443)))

(declare-fun b!283058 () Bool)

(assert (=> b!283058 (= e!179584 (contains!1966 Nil!4480 (select (arr!6702 lt!139711) #b00000000000000000000000000000000)))))

(declare-fun d!65137 () Bool)

(declare-fun res!146133 () Bool)

(assert (=> d!65137 (=> res!146133 e!179585)))

(assert (=> d!65137 (= res!146133 (bvsge #b00000000000000000000000000000000 (size!7055 lt!139711)))))

(assert (=> d!65137 (= (arrayNoDuplicates!0 lt!139711 #b00000000000000000000000000000000 Nil!4480) e!179585)))

(declare-fun bm!25440 () Bool)

(assert (=> bm!25440 (= call!25443 (arrayNoDuplicates!0 lt!139711 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46014 (Cons!4479 (select (arr!6702 lt!139711) #b00000000000000000000000000000000) Nil!4480) Nil!4480)))))

(assert (= (and d!65137 (not res!146133)) b!283056))

(assert (= (and b!283056 res!146132) b!283058))

(assert (= (and b!283056 res!146131) b!283054))

(assert (= (and b!283054 c!46014) b!283057))

(assert (= (and b!283054 (not c!46014)) b!283055))

(assert (= (or b!283057 b!283055) bm!25440))

(declare-fun m!297419 () Bool)

(assert (=> b!283054 m!297419))

(assert (=> b!283054 m!297419))

(declare-fun m!297421 () Bool)

(assert (=> b!283054 m!297421))

(assert (=> b!283056 m!297419))

(assert (=> b!283056 m!297419))

(assert (=> b!283056 m!297421))

(assert (=> b!283058 m!297419))

(assert (=> b!283058 m!297419))

(declare-fun m!297423 () Bool)

(assert (=> b!283058 m!297423))

(assert (=> bm!25440 m!297419))

(declare-fun m!297425 () Bool)

(assert (=> bm!25440 m!297425))

(assert (=> b!282911 d!65137))

(declare-fun d!65139 () Bool)

(declare-fun e!179601 () Bool)

(assert (=> d!65139 e!179601))

(declare-fun res!146142 () Bool)

(assert (=> d!65139 (=> (not res!146142) (not e!179601))))

(assert (=> d!65139 (= res!146142 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7055 a!3325))))))

(declare-fun lt!139791 () Unit!8964)

(declare-fun choose!41 (array!14121 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4483) Unit!8964)

(assert (=> d!65139 (= lt!139791 (choose!41 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4480))))

(assert (=> d!65139 (bvslt (size!7055 a!3325) #b01111111111111111111111111111111)))

(assert (=> d!65139 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4480) lt!139791)))

(declare-fun b!283077 () Bool)

(assert (=> b!283077 (= e!179601 (arrayNoDuplicates!0 (array!14122 (store (arr!6702 a!3325) i!1267 k0!2581) (size!7055 a!3325)) #b00000000000000000000000000000000 Nil!4480))))

(assert (= (and d!65139 res!146142) b!283077))

(declare-fun m!297441 () Bool)

(assert (=> d!65139 m!297441))

(assert (=> b!283077 m!297247))

(declare-fun m!297443 () Bool)

(assert (=> b!283077 m!297443))

(assert (=> b!282911 d!65139))

(declare-fun d!65143 () Bool)

(assert (=> d!65143 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!139797 () Unit!8964)

(declare-fun choose!38 (array!14121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8964)

(assert (=> d!65143 (= lt!139797 (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> d!65143 (validMask!0 mask!3868)))

(assert (=> d!65143 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) lt!139797)))

(declare-fun bs!10037 () Bool)

(assert (= bs!10037 d!65143))

(assert (=> bs!10037 m!297255))

(declare-fun m!297459 () Bool)

(assert (=> bs!10037 m!297459))

(assert (=> bs!10037 m!297227))

(assert (=> b!282911 d!65143))

(declare-fun d!65149 () Bool)

(declare-fun res!146153 () Bool)

(declare-fun e!179625 () Bool)

(assert (=> d!65149 (=> res!146153 e!179625)))

(assert (=> d!65149 (= res!146153 (bvsge startIndex!26 (size!7055 a!3325)))))

(assert (=> d!65149 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868) e!179625)))

(declare-fun bm!25447 () Bool)

(declare-fun call!25450 () Bool)

(assert (=> bm!25447 (= call!25450 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283113 () Bool)

(declare-fun e!179624 () Bool)

(assert (=> b!283113 (= e!179625 e!179624)))

(declare-fun c!46033 () Bool)

(assert (=> b!283113 (= c!46033 (validKeyInArray!0 (select (arr!6702 a!3325) startIndex!26)))))

(declare-fun b!283114 () Bool)

(declare-fun e!179626 () Bool)

(assert (=> b!283114 (= e!179624 e!179626)))

(declare-fun lt!139815 () (_ BitVec 64))

(assert (=> b!283114 (= lt!139815 (select (arr!6702 a!3325) startIndex!26))))

(declare-fun lt!139814 () Unit!8964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14121 (_ BitVec 64) (_ BitVec 32)) Unit!8964)

(assert (=> b!283114 (= lt!139814 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!139815 startIndex!26))))

(assert (=> b!283114 (arrayContainsKey!0 a!3325 lt!139815 #b00000000000000000000000000000000)))

(declare-fun lt!139813 () Unit!8964)

(assert (=> b!283114 (= lt!139813 lt!139814)))

(declare-fun res!146152 () Bool)

(assert (=> b!283114 (= res!146152 (= (seekEntryOrOpen!0 (select (arr!6702 a!3325) startIndex!26) a!3325 mask!3868) (Found!1859 startIndex!26)))))

(assert (=> b!283114 (=> (not res!146152) (not e!179626))))

(declare-fun b!283115 () Bool)

(assert (=> b!283115 (= e!179624 call!25450)))

(declare-fun b!283116 () Bool)

(assert (=> b!283116 (= e!179626 call!25450)))

(assert (= (and d!65149 (not res!146153)) b!283113))

(assert (= (and b!283113 c!46033) b!283114))

(assert (= (and b!283113 (not c!46033)) b!283115))

(assert (= (and b!283114 res!146152) b!283116))

(assert (= (or b!283116 b!283115) bm!25447))

(declare-fun m!297475 () Bool)

(assert (=> bm!25447 m!297475))

(assert (=> b!283113 m!297257))

(assert (=> b!283113 m!297257))

(assert (=> b!283113 m!297267))

(assert (=> b!283114 m!297257))

(declare-fun m!297477 () Bool)

(assert (=> b!283114 m!297477))

(declare-fun m!297479 () Bool)

(assert (=> b!283114 m!297479))

(assert (=> b!283114 m!297257))

(assert (=> b!283114 m!297265))

(assert (=> b!282911 d!65149))

(declare-fun b!283117 () Bool)

(declare-fun e!179627 () SeekEntryResult!1859)

(declare-fun e!179628 () SeekEntryResult!1859)

(assert (=> b!283117 (= e!179627 e!179628)))

(declare-fun lt!139816 () (_ BitVec 64))

(declare-fun lt!139818 () SeekEntryResult!1859)

(assert (=> b!283117 (= lt!139816 (select (arr!6702 lt!139711) (index!9608 lt!139818)))))

(declare-fun c!46036 () Bool)

(assert (=> b!283117 (= c!46036 (= lt!139816 (select (store (arr!6702 a!3325) i!1267 k0!2581) startIndex!26)))))

(declare-fun lt!139817 () SeekEntryResult!1859)

(declare-fun d!65157 () Bool)

(assert (=> d!65157 (and (or ((_ is Undefined!1859) lt!139817) (not ((_ is Found!1859) lt!139817)) (and (bvsge (index!9607 lt!139817) #b00000000000000000000000000000000) (bvslt (index!9607 lt!139817) (size!7055 lt!139711)))) (or ((_ is Undefined!1859) lt!139817) ((_ is Found!1859) lt!139817) (not ((_ is MissingZero!1859) lt!139817)) (and (bvsge (index!9606 lt!139817) #b00000000000000000000000000000000) (bvslt (index!9606 lt!139817) (size!7055 lt!139711)))) (or ((_ is Undefined!1859) lt!139817) ((_ is Found!1859) lt!139817) ((_ is MissingZero!1859) lt!139817) (not ((_ is MissingVacant!1859) lt!139817)) (and (bvsge (index!9609 lt!139817) #b00000000000000000000000000000000) (bvslt (index!9609 lt!139817) (size!7055 lt!139711)))) (or ((_ is Undefined!1859) lt!139817) (ite ((_ is Found!1859) lt!139817) (= (select (arr!6702 lt!139711) (index!9607 lt!139817)) (select (store (arr!6702 a!3325) i!1267 k0!2581) startIndex!26)) (ite ((_ is MissingZero!1859) lt!139817) (= (select (arr!6702 lt!139711) (index!9606 lt!139817)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1859) lt!139817) (= (select (arr!6702 lt!139711) (index!9609 lt!139817)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65157 (= lt!139817 e!179627)))

(declare-fun c!46035 () Bool)

(assert (=> d!65157 (= c!46035 (and ((_ is Intermediate!1859) lt!139818) (undefined!2671 lt!139818)))))

(assert (=> d!65157 (= lt!139818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6702 a!3325) i!1267 k0!2581) startIndex!26) mask!3868) (select (store (arr!6702 a!3325) i!1267 k0!2581) startIndex!26) lt!139711 mask!3868))))

(assert (=> d!65157 (validMask!0 mask!3868)))

(assert (=> d!65157 (= (seekEntryOrOpen!0 (select (store (arr!6702 a!3325) i!1267 k0!2581) startIndex!26) lt!139711 mask!3868) lt!139817)))

(declare-fun b!283118 () Bool)

(assert (=> b!283118 (= e!179628 (Found!1859 (index!9608 lt!139818)))))

(declare-fun b!283119 () Bool)

(declare-fun e!179629 () SeekEntryResult!1859)

(assert (=> b!283119 (= e!179629 (seekKeyOrZeroReturnVacant!0 (x!27832 lt!139818) (index!9608 lt!139818) (index!9608 lt!139818) (select (store (arr!6702 a!3325) i!1267 k0!2581) startIndex!26) lt!139711 mask!3868))))

(declare-fun b!283120 () Bool)

(assert (=> b!283120 (= e!179627 Undefined!1859)))

(declare-fun b!283121 () Bool)

(declare-fun c!46034 () Bool)

(assert (=> b!283121 (= c!46034 (= lt!139816 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283121 (= e!179628 e!179629)))

(declare-fun b!283122 () Bool)

(assert (=> b!283122 (= e!179629 (MissingZero!1859 (index!9608 lt!139818)))))

(assert (= (and d!65157 c!46035) b!283120))

(assert (= (and d!65157 (not c!46035)) b!283117))

(assert (= (and b!283117 c!46036) b!283118))

(assert (= (and b!283117 (not c!46036)) b!283121))

(assert (= (and b!283121 c!46034) b!283122))

(assert (= (and b!283121 (not c!46034)) b!283119))

(declare-fun m!297481 () Bool)

(assert (=> b!283117 m!297481))

(declare-fun m!297483 () Bool)

(assert (=> d!65157 m!297483))

(assert (=> d!65157 m!297253))

(declare-fun m!297485 () Bool)

(assert (=> d!65157 m!297485))

(declare-fun m!297487 () Bool)

(assert (=> d!65157 m!297487))

(assert (=> d!65157 m!297485))

(assert (=> d!65157 m!297253))

(declare-fun m!297489 () Bool)

(assert (=> d!65157 m!297489))

(assert (=> d!65157 m!297227))

(declare-fun m!297491 () Bool)

(assert (=> d!65157 m!297491))

(assert (=> b!283119 m!297253))

(declare-fun m!297493 () Bool)

(assert (=> b!283119 m!297493))

(assert (=> b!282911 d!65157))

(declare-fun d!65159 () Bool)

(declare-fun res!146163 () Bool)

(declare-fun e!179642 () Bool)

(assert (=> d!65159 (=> res!146163 e!179642)))

(assert (=> d!65159 (= res!146163 (= (select (arr!6702 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65159 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!179642)))

(declare-fun b!283138 () Bool)

(declare-fun e!179643 () Bool)

(assert (=> b!283138 (= e!179642 e!179643)))

(declare-fun res!146164 () Bool)

(assert (=> b!283138 (=> (not res!146164) (not e!179643))))

(assert (=> b!283138 (= res!146164 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7055 a!3325)))))

(declare-fun b!283139 () Bool)

(assert (=> b!283139 (= e!179643 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65159 (not res!146163)) b!283138))

(assert (= (and b!283138 res!146164) b!283139))

(assert (=> d!65159 m!297353))

(declare-fun m!297513 () Bool)

(assert (=> b!283139 m!297513))

(assert (=> b!282906 d!65159))

(declare-fun b!283141 () Bool)

(declare-fun e!179645 () SeekEntryResult!1859)

(declare-fun e!179646 () SeekEntryResult!1859)

(assert (=> b!283141 (= e!179645 e!179646)))

(declare-fun lt!139828 () (_ BitVec 64))

(declare-fun lt!139830 () SeekEntryResult!1859)

(assert (=> b!283141 (= lt!139828 (select (arr!6702 a!3325) (index!9608 lt!139830)))))

(declare-fun c!46042 () Bool)

(assert (=> b!283141 (= c!46042 (= lt!139828 k0!2581))))

(declare-fun d!65165 () Bool)

(declare-fun lt!139829 () SeekEntryResult!1859)

(assert (=> d!65165 (and (or ((_ is Undefined!1859) lt!139829) (not ((_ is Found!1859) lt!139829)) (and (bvsge (index!9607 lt!139829) #b00000000000000000000000000000000) (bvslt (index!9607 lt!139829) (size!7055 a!3325)))) (or ((_ is Undefined!1859) lt!139829) ((_ is Found!1859) lt!139829) (not ((_ is MissingZero!1859) lt!139829)) (and (bvsge (index!9606 lt!139829) #b00000000000000000000000000000000) (bvslt (index!9606 lt!139829) (size!7055 a!3325)))) (or ((_ is Undefined!1859) lt!139829) ((_ is Found!1859) lt!139829) ((_ is MissingZero!1859) lt!139829) (not ((_ is MissingVacant!1859) lt!139829)) (and (bvsge (index!9609 lt!139829) #b00000000000000000000000000000000) (bvslt (index!9609 lt!139829) (size!7055 a!3325)))) (or ((_ is Undefined!1859) lt!139829) (ite ((_ is Found!1859) lt!139829) (= (select (arr!6702 a!3325) (index!9607 lt!139829)) k0!2581) (ite ((_ is MissingZero!1859) lt!139829) (= (select (arr!6702 a!3325) (index!9606 lt!139829)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1859) lt!139829) (= (select (arr!6702 a!3325) (index!9609 lt!139829)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65165 (= lt!139829 e!179645)))

(declare-fun c!46041 () Bool)

(assert (=> d!65165 (= c!46041 (and ((_ is Intermediate!1859) lt!139830) (undefined!2671 lt!139830)))))

(assert (=> d!65165 (= lt!139830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65165 (validMask!0 mask!3868)))

(assert (=> d!65165 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!139829)))

(declare-fun b!283142 () Bool)

(assert (=> b!283142 (= e!179646 (Found!1859 (index!9608 lt!139830)))))

(declare-fun b!283143 () Bool)

(declare-fun e!179647 () SeekEntryResult!1859)

(assert (=> b!283143 (= e!179647 (seekKeyOrZeroReturnVacant!0 (x!27832 lt!139830) (index!9608 lt!139830) (index!9608 lt!139830) k0!2581 a!3325 mask!3868))))

(declare-fun b!283144 () Bool)

(assert (=> b!283144 (= e!179645 Undefined!1859)))

(declare-fun b!283145 () Bool)

(declare-fun c!46040 () Bool)

(assert (=> b!283145 (= c!46040 (= lt!139828 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283145 (= e!179646 e!179647)))

(declare-fun b!283146 () Bool)

(assert (=> b!283146 (= e!179647 (MissingZero!1859 (index!9608 lt!139830)))))

(assert (= (and d!65165 c!46041) b!283144))

(assert (= (and d!65165 (not c!46041)) b!283141))

(assert (= (and b!283141 c!46042) b!283142))

(assert (= (and b!283141 (not c!46042)) b!283145))

(assert (= (and b!283145 c!46040) b!283146))

(assert (= (and b!283145 (not c!46040)) b!283143))

(declare-fun m!297519 () Bool)

(assert (=> b!283141 m!297519))

(declare-fun m!297521 () Bool)

(assert (=> d!65165 m!297521))

(declare-fun m!297523 () Bool)

(assert (=> d!65165 m!297523))

(declare-fun m!297525 () Bool)

(assert (=> d!65165 m!297525))

(assert (=> d!65165 m!297523))

(declare-fun m!297527 () Bool)

(assert (=> d!65165 m!297527))

(assert (=> d!65165 m!297227))

(declare-fun m!297529 () Bool)

(assert (=> d!65165 m!297529))

(declare-fun m!297531 () Bool)

(assert (=> b!283143 m!297531))

(assert (=> b!282905 d!65165))

(declare-fun d!65169 () Bool)

(declare-fun res!146167 () Bool)

(declare-fun e!179649 () Bool)

(assert (=> d!65169 (=> res!146167 e!179649)))

(assert (=> d!65169 (= res!146167 (bvsge #b00000000000000000000000000000000 (size!7055 a!3325)))))

(assert (=> d!65169 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!179649)))

(declare-fun bm!25448 () Bool)

(declare-fun call!25451 () Bool)

(assert (=> bm!25448 (= call!25451 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!283147 () Bool)

(declare-fun e!179648 () Bool)

(assert (=> b!283147 (= e!179649 e!179648)))

(declare-fun c!46043 () Bool)

(assert (=> b!283147 (= c!46043 (validKeyInArray!0 (select (arr!6702 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283148 () Bool)

(declare-fun e!179650 () Bool)

(assert (=> b!283148 (= e!179648 e!179650)))

(declare-fun lt!139833 () (_ BitVec 64))

(assert (=> b!283148 (= lt!139833 (select (arr!6702 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!139832 () Unit!8964)

(assert (=> b!283148 (= lt!139832 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!139833 #b00000000000000000000000000000000))))

(assert (=> b!283148 (arrayContainsKey!0 a!3325 lt!139833 #b00000000000000000000000000000000)))

(declare-fun lt!139831 () Unit!8964)

(assert (=> b!283148 (= lt!139831 lt!139832)))

(declare-fun res!146166 () Bool)

(assert (=> b!283148 (= res!146166 (= (seekEntryOrOpen!0 (select (arr!6702 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1859 #b00000000000000000000000000000000)))))

(assert (=> b!283148 (=> (not res!146166) (not e!179650))))

(declare-fun b!283149 () Bool)

(assert (=> b!283149 (= e!179648 call!25451)))

(declare-fun b!283150 () Bool)

(assert (=> b!283150 (= e!179650 call!25451)))

(assert (= (and d!65169 (not res!146167)) b!283147))

(assert (= (and b!283147 c!46043) b!283148))

(assert (= (and b!283147 (not c!46043)) b!283149))

(assert (= (and b!283148 res!146166) b!283150))

(assert (= (or b!283150 b!283149) bm!25448))

(declare-fun m!297533 () Bool)

(assert (=> bm!25448 m!297533))

(assert (=> b!283147 m!297353))

(assert (=> b!283147 m!297353))

(assert (=> b!283147 m!297355))

(assert (=> b!283148 m!297353))

(declare-fun m!297535 () Bool)

(assert (=> b!283148 m!297535))

(declare-fun m!297537 () Bool)

(assert (=> b!283148 m!297537))

(assert (=> b!283148 m!297353))

(declare-fun m!297539 () Bool)

(assert (=> b!283148 m!297539))

(assert (=> b!282903 d!65169))

(declare-fun d!65171 () Bool)

(assert (=> d!65171 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27314 d!65171))

(declare-fun d!65183 () Bool)

(assert (=> d!65183 (= (array_inv!4674 a!3325) (bvsge (size!7055 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27314 d!65183))

(declare-fun d!65185 () Bool)

(declare-fun res!146189 () Bool)

(declare-fun e!179682 () Bool)

(assert (=> d!65185 (=> res!146189 e!179682)))

(assert (=> d!65185 (= res!146189 (bvsge startIndex!26 (size!7055 lt!139711)))))

(assert (=> d!65185 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!139711 mask!3868) e!179682)))

(declare-fun call!25459 () Bool)

(declare-fun bm!25456 () Bool)

(assert (=> bm!25456 (= call!25459 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!139711 mask!3868))))

(declare-fun b!283191 () Bool)

(declare-fun e!179681 () Bool)

(assert (=> b!283191 (= e!179682 e!179681)))

(declare-fun c!46054 () Bool)

(assert (=> b!283191 (= c!46054 (validKeyInArray!0 (select (arr!6702 lt!139711) startIndex!26)))))

(declare-fun b!283192 () Bool)

(declare-fun e!179683 () Bool)

(assert (=> b!283192 (= e!179681 e!179683)))

(declare-fun lt!139857 () (_ BitVec 64))

(assert (=> b!283192 (= lt!139857 (select (arr!6702 lt!139711) startIndex!26))))

(declare-fun lt!139856 () Unit!8964)

(assert (=> b!283192 (= lt!139856 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139711 lt!139857 startIndex!26))))

(assert (=> b!283192 (arrayContainsKey!0 lt!139711 lt!139857 #b00000000000000000000000000000000)))

(declare-fun lt!139855 () Unit!8964)

(assert (=> b!283192 (= lt!139855 lt!139856)))

(declare-fun res!146188 () Bool)

(assert (=> b!283192 (= res!146188 (= (seekEntryOrOpen!0 (select (arr!6702 lt!139711) startIndex!26) lt!139711 mask!3868) (Found!1859 startIndex!26)))))

(assert (=> b!283192 (=> (not res!146188) (not e!179683))))

(declare-fun b!283193 () Bool)

(assert (=> b!283193 (= e!179681 call!25459)))

(declare-fun b!283194 () Bool)

(assert (=> b!283194 (= e!179683 call!25459)))

(assert (= (and d!65185 (not res!146189)) b!283191))

(assert (= (and b!283191 c!46054) b!283192))

(assert (= (and b!283191 (not c!46054)) b!283193))

(assert (= (and b!283192 res!146188) b!283194))

(assert (= (or b!283194 b!283193) bm!25456))

(declare-fun m!297581 () Bool)

(assert (=> bm!25456 m!297581))

(declare-fun m!297583 () Bool)

(assert (=> b!283191 m!297583))

(assert (=> b!283191 m!297583))

(declare-fun m!297585 () Bool)

(assert (=> b!283191 m!297585))

(assert (=> b!283192 m!297583))

(declare-fun m!297587 () Bool)

(assert (=> b!283192 m!297587))

(declare-fun m!297589 () Bool)

(assert (=> b!283192 m!297589))

(assert (=> b!283192 m!297583))

(declare-fun m!297591 () Bool)

(assert (=> b!283192 m!297591))

(assert (=> b!282909 d!65185))

(declare-fun d!65187 () Bool)

(declare-fun res!146191 () Bool)

(declare-fun e!179685 () Bool)

(assert (=> d!65187 (=> res!146191 e!179685)))

(assert (=> d!65187 (= res!146191 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!7055 lt!139711)))))

(assert (=> d!65187 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139711 mask!3868) e!179685)))

(declare-fun bm!25457 () Bool)

(declare-fun call!25460 () Bool)

(assert (=> bm!25457 (= call!25460 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!139711 mask!3868))))

(declare-fun b!283195 () Bool)

(declare-fun e!179684 () Bool)

(assert (=> b!283195 (= e!179685 e!179684)))

(declare-fun c!46055 () Bool)

(assert (=> b!283195 (= c!46055 (validKeyInArray!0 (select (arr!6702 lt!139711) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun b!283196 () Bool)

(declare-fun e!179686 () Bool)

(assert (=> b!283196 (= e!179684 e!179686)))

(declare-fun lt!139860 () (_ BitVec 64))

(assert (=> b!283196 (= lt!139860 (select (arr!6702 lt!139711) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!139859 () Unit!8964)

(assert (=> b!283196 (= lt!139859 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!139711 lt!139860 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!283196 (arrayContainsKey!0 lt!139711 lt!139860 #b00000000000000000000000000000000)))

(declare-fun lt!139858 () Unit!8964)

(assert (=> b!283196 (= lt!139858 lt!139859)))

(declare-fun res!146190 () Bool)

(assert (=> b!283196 (= res!146190 (= (seekEntryOrOpen!0 (select (arr!6702 lt!139711) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!139711 mask!3868) (Found!1859 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!283196 (=> (not res!146190) (not e!179686))))

(declare-fun b!283197 () Bool)

(assert (=> b!283197 (= e!179684 call!25460)))

(declare-fun b!283198 () Bool)

(assert (=> b!283198 (= e!179686 call!25460)))

(assert (= (and d!65187 (not res!146191)) b!283195))

(assert (= (and b!283195 c!46055) b!283196))

(assert (= (and b!283195 (not c!46055)) b!283197))

(assert (= (and b!283196 res!146190) b!283198))

(assert (= (or b!283198 b!283197) bm!25457))

(declare-fun m!297593 () Bool)

(assert (=> bm!25457 m!297593))

(declare-fun m!297595 () Bool)

(assert (=> b!283195 m!297595))

(assert (=> b!283195 m!297595))

(declare-fun m!297597 () Bool)

(assert (=> b!283195 m!297597))

(assert (=> b!283196 m!297595))

(declare-fun m!297599 () Bool)

(assert (=> b!283196 m!297599))

(declare-fun m!297601 () Bool)

(assert (=> b!283196 m!297601))

(assert (=> b!283196 m!297595))

(declare-fun m!297603 () Bool)

(assert (=> b!283196 m!297603))

(assert (=> b!282909 d!65187))

(declare-fun d!65189 () Bool)

(declare-fun e!179699 () Bool)

(assert (=> d!65189 e!179699))

(declare-fun res!146197 () Bool)

(assert (=> d!65189 (=> (not res!146197) (not e!179699))))

(assert (=> d!65189 (= res!146197 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7055 a!3325))))))

(declare-fun lt!139872 () Unit!8964)

(declare-fun choose!98 (array!14121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8964)

(assert (=> d!65189 (= lt!139872 (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!65189 (validMask!0 mask!3868)))

(assert (=> d!65189 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!139872)))

(declare-fun b!283218 () Bool)

(assert (=> b!283218 (= e!179699 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14122 (store (arr!6702 a!3325) i!1267 k0!2581) (size!7055 a!3325)) mask!3868))))

(assert (= (and d!65189 res!146197) b!283218))

(declare-fun m!297643 () Bool)

(assert (=> d!65189 m!297643))

(assert (=> d!65189 m!297227))

(assert (=> b!283218 m!297247))

(declare-fun m!297645 () Bool)

(assert (=> b!283218 m!297645))

(assert (=> b!282909 d!65189))

(declare-fun d!65199 () Bool)

(assert (=> d!65199 (= (validKeyInArray!0 (select (arr!6702 a!3325) startIndex!26)) (and (not (= (select (arr!6702 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6702 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!282904 d!65199))

(check-sat (not b!283050) (not b!282982) (not bm!25435) (not b!283139) (not d!65157) (not b!283195) (not bm!25447) (not b!283218) (not d!65117) (not d!65143) (not bm!25448) (not b!283054) (not d!65109) (not b!283143) (not b!283148) (not b!282989) (not b!283113) (not bm!25456) (not b!282984) (not d!65165) (not b!283056) (not b!283119) (not b!283058) (not b!283192) (not b!282986) (not b!283147) (not bm!25440) (not bm!25457) (not d!65139) (not b!283077) (not b!283191) (not d!65189) (not b!283196) (not b!283114))
(check-sat)
