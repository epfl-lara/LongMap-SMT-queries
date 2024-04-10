; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26750 () Bool)

(assert start!26750)

(declare-fun b!277928 () Bool)

(declare-fun res!141735 () Bool)

(declare-fun e!177272 () Bool)

(assert (=> b!277928 (=> (not res!141735) (not e!177272))))

(declare-datatypes ((array!13847 0))(
  ( (array!13848 (arr!6573 (Array (_ BitVec 32) (_ BitVec 64))) (size!6925 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13847)

(declare-datatypes ((List!4381 0))(
  ( (Nil!4378) (Cons!4377 (h!5044 (_ BitVec 64)) (t!9463 List!4381)) )
))
(declare-fun arrayNoDuplicates!0 (array!13847 (_ BitVec 32) List!4381) Bool)

(assert (=> b!277928 (= res!141735 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4378))))

(declare-fun b!277930 () Bool)

(declare-fun res!141729 () Bool)

(declare-fun e!177270 () Bool)

(assert (=> b!277930 (=> (not res!141729) (not e!177270))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13847 (_ BitVec 32)) Bool)

(assert (=> b!277930 (= res!141729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277931 () Bool)

(declare-fun res!141730 () Bool)

(assert (=> b!277931 (=> (not res!141730) (not e!177272))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277931 (= res!141730 (validKeyInArray!0 k0!2581))))

(declare-fun b!277932 () Bool)

(declare-fun res!141732 () Bool)

(assert (=> b!277932 (=> (not res!141732) (not e!177272))))

(declare-fun arrayContainsKey!0 (array!13847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277932 (= res!141732 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277933 () Bool)

(declare-datatypes ((Unit!8794 0))(
  ( (Unit!8795) )
))
(declare-fun e!177271 () Unit!8794)

(declare-fun Unit!8796 () Unit!8794)

(assert (=> b!277933 (= e!177271 Unit!8796)))

(declare-fun res!141728 () Bool)

(assert (=> start!26750 (=> (not res!141728) (not e!177272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26750 (= res!141728 (validMask!0 mask!3868))))

(assert (=> start!26750 e!177272))

(declare-fun array_inv!4536 (array!13847) Bool)

(assert (=> start!26750 (array_inv!4536 a!3325)))

(assert (=> start!26750 true))

(declare-fun b!277929 () Bool)

(assert (=> b!277929 (= e!177272 e!177270)))

(declare-fun res!141734 () Bool)

(assert (=> b!277929 (=> (not res!141734) (not e!177270))))

(declare-datatypes ((SeekEntryResult!1731 0))(
  ( (MissingZero!1731 (index!9094 (_ BitVec 32))) (Found!1731 (index!9095 (_ BitVec 32))) (Intermediate!1731 (undefined!2543 Bool) (index!9096 (_ BitVec 32)) (x!27336 (_ BitVec 32))) (Undefined!1731) (MissingVacant!1731 (index!9097 (_ BitVec 32))) )
))
(declare-fun lt!138129 () SeekEntryResult!1731)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277929 (= res!141734 (or (= lt!138129 (MissingZero!1731 i!1267)) (= lt!138129 (MissingVacant!1731 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13847 (_ BitVec 32)) SeekEntryResult!1731)

(assert (=> b!277929 (= lt!138129 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277934 () Bool)

(declare-fun lt!138133 () array!13847)

(declare-fun e!177269 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!277934 (= e!177269 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!138133 mask!3868)))))

(assert (=> b!277934 (= (seekEntryOrOpen!0 k0!2581 lt!138133 mask!3868) (Found!1731 i!1267))))

(declare-fun lt!138130 () Unit!8794)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13847 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8794)

(assert (=> b!277934 (= lt!138130 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!138131 () Unit!8794)

(assert (=> b!277934 (= lt!138131 e!177271)))

(declare-fun c!45651 () Bool)

(assert (=> b!277934 (= c!45651 (bvslt startIndex!26 (bvsub (size!6925 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277935 () Bool)

(declare-fun res!141733 () Bool)

(assert (=> b!277935 (=> (not res!141733) (not e!177272))))

(assert (=> b!277935 (= res!141733 (and (= (size!6925 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6925 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6925 a!3325))))))

(declare-fun b!277936 () Bool)

(declare-fun lt!138132 () Unit!8794)

(assert (=> b!277936 (= e!177271 lt!138132)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13847 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8794)

(assert (=> b!277936 (= lt!138132 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277936 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138133 mask!3868)))

(declare-fun b!277937 () Bool)

(assert (=> b!277937 (= e!177270 e!177269)))

(declare-fun res!141731 () Bool)

(assert (=> b!277937 (=> (not res!141731) (not e!177269))))

(assert (=> b!277937 (= res!141731 (= startIndex!26 i!1267))))

(assert (=> b!277937 (= lt!138133 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)))))

(assert (= (and start!26750 res!141728) b!277935))

(assert (= (and b!277935 res!141733) b!277931))

(assert (= (and b!277931 res!141730) b!277928))

(assert (= (and b!277928 res!141735) b!277932))

(assert (= (and b!277932 res!141732) b!277929))

(assert (= (and b!277929 res!141734) b!277930))

(assert (= (and b!277930 res!141729) b!277937))

(assert (= (and b!277937 res!141731) b!277934))

(assert (= (and b!277934 c!45651) b!277936))

(assert (= (and b!277934 (not c!45651)) b!277933))

(declare-fun m!292841 () Bool)

(assert (=> b!277928 m!292841))

(declare-fun m!292843 () Bool)

(assert (=> b!277930 m!292843))

(declare-fun m!292845 () Bool)

(assert (=> start!26750 m!292845))

(declare-fun m!292847 () Bool)

(assert (=> start!26750 m!292847))

(declare-fun m!292849 () Bool)

(assert (=> b!277931 m!292849))

(declare-fun m!292851 () Bool)

(assert (=> b!277936 m!292851))

(declare-fun m!292853 () Bool)

(assert (=> b!277936 m!292853))

(declare-fun m!292855 () Bool)

(assert (=> b!277929 m!292855))

(declare-fun m!292857 () Bool)

(assert (=> b!277932 m!292857))

(declare-fun m!292859 () Bool)

(assert (=> b!277937 m!292859))

(declare-fun m!292861 () Bool)

(assert (=> b!277934 m!292861))

(declare-fun m!292863 () Bool)

(assert (=> b!277934 m!292863))

(declare-fun m!292865 () Bool)

(assert (=> b!277934 m!292865))

(check-sat (not b!277931) (not b!277928) (not b!277929) (not b!277932) (not b!277934) (not b!277930) (not b!277936) (not start!26750))
(check-sat)
(get-model)

(declare-fun d!64691 () Bool)

(assert (=> d!64691 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26750 d!64691))

(declare-fun d!64693 () Bool)

(assert (=> d!64693 (= (array_inv!4536 a!3325) (bvsge (size!6925 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26750 d!64693))

(declare-fun b!277982 () Bool)

(declare-fun e!177300 () Bool)

(declare-fun e!177302 () Bool)

(assert (=> b!277982 (= e!177300 e!177302)))

(declare-fun c!45657 () Bool)

(assert (=> b!277982 (= c!45657 (validKeyInArray!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25348 () Bool)

(declare-fun call!25351 () Bool)

(assert (=> bm!25348 (= call!25351 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!277984 () Bool)

(declare-fun e!177301 () Bool)

(assert (=> b!277984 (= e!177302 e!177301)))

(declare-fun lt!138156 () (_ BitVec 64))

(assert (=> b!277984 (= lt!138156 (select (arr!6573 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!138157 () Unit!8794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13847 (_ BitVec 64) (_ BitVec 32)) Unit!8794)

(assert (=> b!277984 (= lt!138157 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138156 #b00000000000000000000000000000000))))

(assert (=> b!277984 (arrayContainsKey!0 a!3325 lt!138156 #b00000000000000000000000000000000)))

(declare-fun lt!138155 () Unit!8794)

(assert (=> b!277984 (= lt!138155 lt!138157)))

(declare-fun res!141770 () Bool)

(assert (=> b!277984 (= res!141770 (= (seekEntryOrOpen!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1731 #b00000000000000000000000000000000)))))

(assert (=> b!277984 (=> (not res!141770) (not e!177301))))

(declare-fun b!277985 () Bool)

(assert (=> b!277985 (= e!177301 call!25351)))

(declare-fun b!277983 () Bool)

(assert (=> b!277983 (= e!177302 call!25351)))

(declare-fun d!64695 () Bool)

(declare-fun res!141771 () Bool)

(assert (=> d!64695 (=> res!141771 e!177300)))

(assert (=> d!64695 (= res!141771 (bvsge #b00000000000000000000000000000000 (size!6925 a!3325)))))

(assert (=> d!64695 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177300)))

(assert (= (and d!64695 (not res!141771)) b!277982))

(assert (= (and b!277982 c!45657) b!277984))

(assert (= (and b!277982 (not c!45657)) b!277983))

(assert (= (and b!277984 res!141770) b!277985))

(assert (= (or b!277985 b!277983) bm!25348))

(declare-fun m!292897 () Bool)

(assert (=> b!277982 m!292897))

(assert (=> b!277982 m!292897))

(declare-fun m!292899 () Bool)

(assert (=> b!277982 m!292899))

(declare-fun m!292901 () Bool)

(assert (=> bm!25348 m!292901))

(assert (=> b!277984 m!292897))

(declare-fun m!292903 () Bool)

(assert (=> b!277984 m!292903))

(declare-fun m!292905 () Bool)

(assert (=> b!277984 m!292905))

(assert (=> b!277984 m!292897))

(declare-fun m!292907 () Bool)

(assert (=> b!277984 m!292907))

(assert (=> b!277930 d!64695))

(declare-fun b!278044 () Bool)

(declare-fun e!177345 () SeekEntryResult!1731)

(assert (=> b!278044 (= e!177345 Undefined!1731)))

(declare-fun b!278045 () Bool)

(declare-fun e!177346 () SeekEntryResult!1731)

(declare-fun lt!138188 () SeekEntryResult!1731)

(assert (=> b!278045 (= e!177346 (Found!1731 (index!9096 lt!138188)))))

(declare-fun b!278046 () Bool)

(declare-fun e!177347 () SeekEntryResult!1731)

(assert (=> b!278046 (= e!177347 (MissingZero!1731 (index!9096 lt!138188)))))

(declare-fun b!278047 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13847 (_ BitVec 32)) SeekEntryResult!1731)

(assert (=> b!278047 (= e!177347 (seekKeyOrZeroReturnVacant!0 (x!27336 lt!138188) (index!9096 lt!138188) (index!9096 lt!138188) k0!2581 a!3325 mask!3868))))

(declare-fun b!278048 () Bool)

(assert (=> b!278048 (= e!177345 e!177346)))

(declare-fun lt!138189 () (_ BitVec 64))

(assert (=> b!278048 (= lt!138189 (select (arr!6573 a!3325) (index!9096 lt!138188)))))

(declare-fun c!45676 () Bool)

(assert (=> b!278048 (= c!45676 (= lt!138189 k0!2581))))

(declare-fun b!278049 () Bool)

(declare-fun c!45674 () Bool)

(assert (=> b!278049 (= c!45674 (= lt!138189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278049 (= e!177346 e!177347)))

(declare-fun d!64703 () Bool)

(declare-fun lt!138190 () SeekEntryResult!1731)

(get-info :version)

(assert (=> d!64703 (and (or ((_ is Undefined!1731) lt!138190) (not ((_ is Found!1731) lt!138190)) (and (bvsge (index!9095 lt!138190) #b00000000000000000000000000000000) (bvslt (index!9095 lt!138190) (size!6925 a!3325)))) (or ((_ is Undefined!1731) lt!138190) ((_ is Found!1731) lt!138190) (not ((_ is MissingZero!1731) lt!138190)) (and (bvsge (index!9094 lt!138190) #b00000000000000000000000000000000) (bvslt (index!9094 lt!138190) (size!6925 a!3325)))) (or ((_ is Undefined!1731) lt!138190) ((_ is Found!1731) lt!138190) ((_ is MissingZero!1731) lt!138190) (not ((_ is MissingVacant!1731) lt!138190)) (and (bvsge (index!9097 lt!138190) #b00000000000000000000000000000000) (bvslt (index!9097 lt!138190) (size!6925 a!3325)))) (or ((_ is Undefined!1731) lt!138190) (ite ((_ is Found!1731) lt!138190) (= (select (arr!6573 a!3325) (index!9095 lt!138190)) k0!2581) (ite ((_ is MissingZero!1731) lt!138190) (= (select (arr!6573 a!3325) (index!9094 lt!138190)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1731) lt!138190) (= (select (arr!6573 a!3325) (index!9097 lt!138190)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64703 (= lt!138190 e!177345)))

(declare-fun c!45675 () Bool)

(assert (=> d!64703 (= c!45675 (and ((_ is Intermediate!1731) lt!138188) (undefined!2543 lt!138188)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13847 (_ BitVec 32)) SeekEntryResult!1731)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64703 (= lt!138188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!64703 (validMask!0 mask!3868)))

(assert (=> d!64703 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138190)))

(assert (= (and d!64703 c!45675) b!278044))

(assert (= (and d!64703 (not c!45675)) b!278048))

(assert (= (and b!278048 c!45676) b!278045))

(assert (= (and b!278048 (not c!45676)) b!278049))

(assert (= (and b!278049 c!45674) b!278046))

(assert (= (and b!278049 (not c!45674)) b!278047))

(declare-fun m!292953 () Bool)

(assert (=> b!278047 m!292953))

(declare-fun m!292955 () Bool)

(assert (=> b!278048 m!292955))

(declare-fun m!292957 () Bool)

(assert (=> d!64703 m!292957))

(declare-fun m!292959 () Bool)

(assert (=> d!64703 m!292959))

(declare-fun m!292961 () Bool)

(assert (=> d!64703 m!292961))

(declare-fun m!292963 () Bool)

(assert (=> d!64703 m!292963))

(assert (=> d!64703 m!292961))

(declare-fun m!292965 () Bool)

(assert (=> d!64703 m!292965))

(assert (=> d!64703 m!292845))

(assert (=> b!277929 d!64703))

(declare-fun b!278050 () Bool)

(declare-fun e!177348 () Bool)

(declare-fun e!177350 () Bool)

(assert (=> b!278050 (= e!177348 e!177350)))

(declare-fun c!45677 () Bool)

(assert (=> b!278050 (= c!45677 (validKeyInArray!0 (select (arr!6573 lt!138133) startIndex!26)))))

(declare-fun call!25362 () Bool)

(declare-fun bm!25359 () Bool)

(assert (=> bm!25359 (= call!25362 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!138133 mask!3868))))

(declare-fun b!278052 () Bool)

(declare-fun e!177349 () Bool)

(assert (=> b!278052 (= e!177350 e!177349)))

(declare-fun lt!138192 () (_ BitVec 64))

(assert (=> b!278052 (= lt!138192 (select (arr!6573 lt!138133) startIndex!26))))

(declare-fun lt!138193 () Unit!8794)

(assert (=> b!278052 (= lt!138193 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138133 lt!138192 startIndex!26))))

(assert (=> b!278052 (arrayContainsKey!0 lt!138133 lt!138192 #b00000000000000000000000000000000)))

(declare-fun lt!138191 () Unit!8794)

(assert (=> b!278052 (= lt!138191 lt!138193)))

(declare-fun res!141798 () Bool)

(assert (=> b!278052 (= res!141798 (= (seekEntryOrOpen!0 (select (arr!6573 lt!138133) startIndex!26) lt!138133 mask!3868) (Found!1731 startIndex!26)))))

(assert (=> b!278052 (=> (not res!141798) (not e!177349))))

(declare-fun b!278053 () Bool)

(assert (=> b!278053 (= e!177349 call!25362)))

(declare-fun b!278051 () Bool)

(assert (=> b!278051 (= e!177350 call!25362)))

(declare-fun d!64717 () Bool)

(declare-fun res!141799 () Bool)

(assert (=> d!64717 (=> res!141799 e!177348)))

(assert (=> d!64717 (= res!141799 (bvsge startIndex!26 (size!6925 lt!138133)))))

(assert (=> d!64717 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!138133 mask!3868) e!177348)))

(assert (= (and d!64717 (not res!141799)) b!278050))

(assert (= (and b!278050 c!45677) b!278052))

(assert (= (and b!278050 (not c!45677)) b!278051))

(assert (= (and b!278052 res!141798) b!278053))

(assert (= (or b!278053 b!278051) bm!25359))

(declare-fun m!292967 () Bool)

(assert (=> b!278050 m!292967))

(assert (=> b!278050 m!292967))

(declare-fun m!292969 () Bool)

(assert (=> b!278050 m!292969))

(declare-fun m!292971 () Bool)

(assert (=> bm!25359 m!292971))

(assert (=> b!278052 m!292967))

(declare-fun m!292973 () Bool)

(assert (=> b!278052 m!292973))

(declare-fun m!292975 () Bool)

(assert (=> b!278052 m!292975))

(assert (=> b!278052 m!292967))

(declare-fun m!292977 () Bool)

(assert (=> b!278052 m!292977))

(assert (=> b!277934 d!64717))

(declare-fun b!278054 () Bool)

(declare-fun e!177351 () SeekEntryResult!1731)

(assert (=> b!278054 (= e!177351 Undefined!1731)))

(declare-fun b!278055 () Bool)

(declare-fun e!177352 () SeekEntryResult!1731)

(declare-fun lt!138194 () SeekEntryResult!1731)

(assert (=> b!278055 (= e!177352 (Found!1731 (index!9096 lt!138194)))))

(declare-fun b!278056 () Bool)

(declare-fun e!177353 () SeekEntryResult!1731)

(assert (=> b!278056 (= e!177353 (MissingZero!1731 (index!9096 lt!138194)))))

(declare-fun b!278057 () Bool)

(assert (=> b!278057 (= e!177353 (seekKeyOrZeroReturnVacant!0 (x!27336 lt!138194) (index!9096 lt!138194) (index!9096 lt!138194) k0!2581 lt!138133 mask!3868))))

(declare-fun b!278058 () Bool)

(assert (=> b!278058 (= e!177351 e!177352)))

(declare-fun lt!138195 () (_ BitVec 64))

(assert (=> b!278058 (= lt!138195 (select (arr!6573 lt!138133) (index!9096 lt!138194)))))

(declare-fun c!45680 () Bool)

(assert (=> b!278058 (= c!45680 (= lt!138195 k0!2581))))

(declare-fun b!278059 () Bool)

(declare-fun c!45678 () Bool)

(assert (=> b!278059 (= c!45678 (= lt!138195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278059 (= e!177352 e!177353)))

(declare-fun d!64719 () Bool)

(declare-fun lt!138196 () SeekEntryResult!1731)

(assert (=> d!64719 (and (or ((_ is Undefined!1731) lt!138196) (not ((_ is Found!1731) lt!138196)) (and (bvsge (index!9095 lt!138196) #b00000000000000000000000000000000) (bvslt (index!9095 lt!138196) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138196) ((_ is Found!1731) lt!138196) (not ((_ is MissingZero!1731) lt!138196)) (and (bvsge (index!9094 lt!138196) #b00000000000000000000000000000000) (bvslt (index!9094 lt!138196) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138196) ((_ is Found!1731) lt!138196) ((_ is MissingZero!1731) lt!138196) (not ((_ is MissingVacant!1731) lt!138196)) (and (bvsge (index!9097 lt!138196) #b00000000000000000000000000000000) (bvslt (index!9097 lt!138196) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138196) (ite ((_ is Found!1731) lt!138196) (= (select (arr!6573 lt!138133) (index!9095 lt!138196)) k0!2581) (ite ((_ is MissingZero!1731) lt!138196) (= (select (arr!6573 lt!138133) (index!9094 lt!138196)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1731) lt!138196) (= (select (arr!6573 lt!138133) (index!9097 lt!138196)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64719 (= lt!138196 e!177351)))

(declare-fun c!45679 () Bool)

(assert (=> d!64719 (= c!45679 (and ((_ is Intermediate!1731) lt!138194) (undefined!2543 lt!138194)))))

(assert (=> d!64719 (= lt!138194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 lt!138133 mask!3868))))

(assert (=> d!64719 (validMask!0 mask!3868)))

(assert (=> d!64719 (= (seekEntryOrOpen!0 k0!2581 lt!138133 mask!3868) lt!138196)))

(assert (= (and d!64719 c!45679) b!278054))

(assert (= (and d!64719 (not c!45679)) b!278058))

(assert (= (and b!278058 c!45680) b!278055))

(assert (= (and b!278058 (not c!45680)) b!278059))

(assert (= (and b!278059 c!45678) b!278056))

(assert (= (and b!278059 (not c!45678)) b!278057))

(declare-fun m!292979 () Bool)

(assert (=> b!278057 m!292979))

(declare-fun m!292981 () Bool)

(assert (=> b!278058 m!292981))

(declare-fun m!292983 () Bool)

(assert (=> d!64719 m!292983))

(declare-fun m!292985 () Bool)

(assert (=> d!64719 m!292985))

(assert (=> d!64719 m!292961))

(declare-fun m!292987 () Bool)

(assert (=> d!64719 m!292987))

(assert (=> d!64719 m!292961))

(declare-fun m!292989 () Bool)

(assert (=> d!64719 m!292989))

(assert (=> d!64719 m!292845))

(assert (=> b!277934 d!64719))

(declare-fun d!64721 () Bool)

(declare-fun e!177359 () Bool)

(assert (=> d!64721 e!177359))

(declare-fun res!141804 () Bool)

(assert (=> d!64721 (=> (not res!141804) (not e!177359))))

(assert (=> d!64721 (= res!141804 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6925 a!3325))))))

(declare-fun lt!138202 () Unit!8794)

(declare-fun choose!8 (array!13847 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8794)

(assert (=> d!64721 (= lt!138202 (choose!8 a!3325 i!1267 k0!2581 mask!3868))))

(assert (=> d!64721 (validMask!0 mask!3868)))

(assert (=> d!64721 (= (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868) lt!138202)))

(declare-fun b!278066 () Bool)

(assert (=> b!278066 (= e!177359 (= (seekEntryOrOpen!0 k0!2581 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) mask!3868) (Found!1731 i!1267)))))

(assert (= (and d!64721 res!141804) b!278066))

(declare-fun m!293003 () Bool)

(assert (=> d!64721 m!293003))

(assert (=> d!64721 m!292845))

(assert (=> b!278066 m!292859))

(declare-fun m!293005 () Bool)

(assert (=> b!278066 m!293005))

(assert (=> b!277934 d!64721))

(declare-fun b!278089 () Bool)

(declare-fun e!177375 () Bool)

(declare-fun contains!1962 (List!4381 (_ BitVec 64)) Bool)

(assert (=> b!278089 (= e!177375 (contains!1962 Nil!4378 (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278090 () Bool)

(declare-fun e!177377 () Bool)

(declare-fun call!25366 () Bool)

(assert (=> b!278090 (= e!177377 call!25366)))

(declare-fun b!278091 () Bool)

(declare-fun e!177376 () Bool)

(declare-fun e!177374 () Bool)

(assert (=> b!278091 (= e!177376 e!177374)))

(declare-fun res!141811 () Bool)

(assert (=> b!278091 (=> (not res!141811) (not e!177374))))

(assert (=> b!278091 (= res!141811 (not e!177375))))

(declare-fun res!141813 () Bool)

(assert (=> b!278091 (=> (not res!141813) (not e!177375))))

(assert (=> b!278091 (= res!141813 (validKeyInArray!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25363 () Bool)

(declare-fun c!45690 () Bool)

(assert (=> bm!25363 (= call!25366 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45690 (Cons!4377 (select (arr!6573 a!3325) #b00000000000000000000000000000000) Nil!4378) Nil!4378)))))

(declare-fun b!278092 () Bool)

(assert (=> b!278092 (= e!177374 e!177377)))

(assert (=> b!278092 (= c!45690 (validKeyInArray!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64729 () Bool)

(declare-fun res!141812 () Bool)

(assert (=> d!64729 (=> res!141812 e!177376)))

(assert (=> d!64729 (= res!141812 (bvsge #b00000000000000000000000000000000 (size!6925 a!3325)))))

(assert (=> d!64729 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4378) e!177376)))

(declare-fun b!278093 () Bool)

(assert (=> b!278093 (= e!177377 call!25366)))

(assert (= (and d!64729 (not res!141812)) b!278091))

(assert (= (and b!278091 res!141813) b!278089))

(assert (= (and b!278091 res!141811) b!278092))

(assert (= (and b!278092 c!45690) b!278093))

(assert (= (and b!278092 (not c!45690)) b!278090))

(assert (= (or b!278093 b!278090) bm!25363))

(assert (=> b!278089 m!292897))

(assert (=> b!278089 m!292897))

(declare-fun m!293007 () Bool)

(assert (=> b!278089 m!293007))

(assert (=> b!278091 m!292897))

(assert (=> b!278091 m!292897))

(assert (=> b!278091 m!292899))

(assert (=> bm!25363 m!292897))

(declare-fun m!293009 () Bool)

(assert (=> bm!25363 m!293009))

(assert (=> b!278092 m!292897))

(assert (=> b!278092 m!292897))

(assert (=> b!278092 m!292899))

(assert (=> b!277928 d!64729))

(declare-fun d!64731 () Bool)

(declare-fun res!141818 () Bool)

(declare-fun e!177385 () Bool)

(assert (=> d!64731 (=> res!141818 e!177385)))

(assert (=> d!64731 (= res!141818 (= (select (arr!6573 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!64731 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!177385)))

(declare-fun b!278104 () Bool)

(declare-fun e!177386 () Bool)

(assert (=> b!278104 (= e!177385 e!177386)))

(declare-fun res!141819 () Bool)

(assert (=> b!278104 (=> (not res!141819) (not e!177386))))

(assert (=> b!278104 (= res!141819 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6925 a!3325)))))

(declare-fun b!278105 () Bool)

(assert (=> b!278105 (= e!177386 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64731 (not res!141818)) b!278104))

(assert (= (and b!278104 res!141819) b!278105))

(assert (=> d!64731 m!292897))

(declare-fun m!293025 () Bool)

(assert (=> b!278105 m!293025))

(assert (=> b!277932 d!64731))

(declare-fun d!64735 () Bool)

(assert (=> d!64735 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!277931 d!64735))

(declare-fun d!64737 () Bool)

(declare-fun e!177401 () Bool)

(assert (=> d!64737 e!177401))

(declare-fun res!141827 () Bool)

(assert (=> d!64737 (=> (not res!141827) (not e!177401))))

(assert (=> d!64737 (= res!141827 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6925 a!3325))))))

(declare-fun lt!138226 () Unit!8794)

(declare-fun choose!98 (array!13847 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8794)

(assert (=> d!64737 (= lt!138226 (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!64737 (validMask!0 mask!3868)))

(assert (=> d!64737 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!138226)))

(declare-fun b!278127 () Bool)

(assert (=> b!278127 (= e!177401 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) mask!3868))))

(assert (= (and d!64737 res!141827) b!278127))

(declare-fun m!293041 () Bool)

(assert (=> d!64737 m!293041))

(assert (=> d!64737 m!292845))

(assert (=> b!278127 m!292859))

(declare-fun m!293043 () Bool)

(assert (=> b!278127 m!293043))

(assert (=> b!277936 d!64737))

(declare-fun b!278128 () Bool)

(declare-fun e!177402 () Bool)

(declare-fun e!177404 () Bool)

(assert (=> b!278128 (= e!177402 e!177404)))

(declare-fun c!45701 () Bool)

(assert (=> b!278128 (= c!45701 (validKeyInArray!0 (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun call!25368 () Bool)

(declare-fun bm!25365 () Bool)

(assert (=> bm!25365 (= call!25368 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!138133 mask!3868))))

(declare-fun b!278130 () Bool)

(declare-fun e!177403 () Bool)

(assert (=> b!278130 (= e!177404 e!177403)))

(declare-fun lt!138228 () (_ BitVec 64))

(assert (=> b!278130 (= lt!138228 (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!138229 () Unit!8794)

(assert (=> b!278130 (= lt!138229 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138133 lt!138228 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!278130 (arrayContainsKey!0 lt!138133 lt!138228 #b00000000000000000000000000000000)))

(declare-fun lt!138227 () Unit!8794)

(assert (=> b!278130 (= lt!138227 lt!138229)))

(declare-fun res!141828 () Bool)

(assert (=> b!278130 (= res!141828 (= (seekEntryOrOpen!0 (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138133 mask!3868) (Found!1731 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!278130 (=> (not res!141828) (not e!177403))))

(declare-fun b!278131 () Bool)

(assert (=> b!278131 (= e!177403 call!25368)))

(declare-fun b!278129 () Bool)

(assert (=> b!278129 (= e!177404 call!25368)))

(declare-fun d!64743 () Bool)

(declare-fun res!141829 () Bool)

(assert (=> d!64743 (=> res!141829 e!177402)))

(assert (=> d!64743 (= res!141829 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!6925 lt!138133)))))

(assert (=> d!64743 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138133 mask!3868) e!177402)))

(assert (= (and d!64743 (not res!141829)) b!278128))

(assert (= (and b!278128 c!45701) b!278130))

(assert (= (and b!278128 (not c!45701)) b!278129))

(assert (= (and b!278130 res!141828) b!278131))

(assert (= (or b!278131 b!278129) bm!25365))

(declare-fun m!293045 () Bool)

(assert (=> b!278128 m!293045))

(assert (=> b!278128 m!293045))

(declare-fun m!293047 () Bool)

(assert (=> b!278128 m!293047))

(declare-fun m!293049 () Bool)

(assert (=> bm!25365 m!293049))

(assert (=> b!278130 m!293045))

(declare-fun m!293051 () Bool)

(assert (=> b!278130 m!293051))

(declare-fun m!293053 () Bool)

(assert (=> b!278130 m!293053))

(assert (=> b!278130 m!293045))

(declare-fun m!293055 () Bool)

(assert (=> b!278130 m!293055))

(assert (=> b!277936 d!64743))

(check-sat (not b!278130) (not d!64703) (not b!278127) (not b!278050) (not b!278089) (not b!278057) (not b!278128) (not b!277982) (not b!278066) (not b!278092) (not bm!25363) (not b!278091) (not bm!25348) (not b!277984) (not d!64737) (not b!278105) (not bm!25359) (not d!64721) (not b!278047) (not d!64719) (not bm!25365) (not b!278052))
(check-sat)
(get-model)

(declare-fun b!278181 () Bool)

(declare-fun e!177441 () Bool)

(declare-fun e!177443 () Bool)

(assert (=> b!278181 (= e!177441 e!177443)))

(declare-fun c!45715 () Bool)

(assert (=> b!278181 (= c!45715 (validKeyInArray!0 (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun call!25373 () Bool)

(declare-fun bm!25370 () Bool)

(assert (=> bm!25370 (= call!25373 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!138133 mask!3868))))

(declare-fun b!278183 () Bool)

(declare-fun e!177442 () Bool)

(assert (=> b!278183 (= e!177443 e!177442)))

(declare-fun lt!138249 () (_ BitVec 64))

(assert (=> b!278183 (= lt!138249 (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!138250 () Unit!8794)

(assert (=> b!278183 (= lt!138250 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138133 lt!138249 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!278183 (arrayContainsKey!0 lt!138133 lt!138249 #b00000000000000000000000000000000)))

(declare-fun lt!138248 () Unit!8794)

(assert (=> b!278183 (= lt!138248 lt!138250)))

(declare-fun res!141853 () Bool)

(assert (=> b!278183 (= res!141853 (= (seekEntryOrOpen!0 (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)) lt!138133 mask!3868) (Found!1731 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!278183 (=> (not res!141853) (not e!177442))))

(declare-fun b!278184 () Bool)

(assert (=> b!278184 (= e!177442 call!25373)))

(declare-fun b!278182 () Bool)

(assert (=> b!278182 (= e!177443 call!25373)))

(declare-fun d!64763 () Bool)

(declare-fun res!141854 () Bool)

(assert (=> d!64763 (=> res!141854 e!177441)))

(assert (=> d!64763 (= res!141854 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) (size!6925 lt!138133)))))

(assert (=> d!64763 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!138133 mask!3868) e!177441)))

(assert (= (and d!64763 (not res!141854)) b!278181))

(assert (= (and b!278181 c!45715) b!278183))

(assert (= (and b!278181 (not c!45715)) b!278182))

(assert (= (and b!278183 res!141853) b!278184))

(assert (= (or b!278184 b!278182) bm!25370))

(declare-fun m!293121 () Bool)

(assert (=> b!278181 m!293121))

(assert (=> b!278181 m!293121))

(declare-fun m!293123 () Bool)

(assert (=> b!278181 m!293123))

(declare-fun m!293125 () Bool)

(assert (=> bm!25370 m!293125))

(assert (=> b!278183 m!293121))

(declare-fun m!293127 () Bool)

(assert (=> b!278183 m!293127))

(declare-fun m!293129 () Bool)

(assert (=> b!278183 m!293129))

(assert (=> b!278183 m!293121))

(declare-fun m!293131 () Bool)

(assert (=> b!278183 m!293131))

(assert (=> bm!25365 d!64763))

(declare-fun b!278185 () Bool)

(declare-fun e!177444 () Bool)

(declare-fun e!177446 () Bool)

(assert (=> b!278185 (= e!177444 e!177446)))

(declare-fun c!45716 () Bool)

(assert (=> b!278185 (= c!45716 (validKeyInArray!0 (select (arr!6573 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25371 () Bool)

(declare-fun call!25374 () Bool)

(assert (=> bm!25371 (= call!25374 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!278187 () Bool)

(declare-fun e!177445 () Bool)

(assert (=> b!278187 (= e!177446 e!177445)))

(declare-fun lt!138252 () (_ BitVec 64))

(assert (=> b!278187 (= lt!138252 (select (arr!6573 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!138253 () Unit!8794)

(assert (=> b!278187 (= lt!138253 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138252 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!278187 (arrayContainsKey!0 a!3325 lt!138252 #b00000000000000000000000000000000)))

(declare-fun lt!138251 () Unit!8794)

(assert (=> b!278187 (= lt!138251 lt!138253)))

(declare-fun res!141855 () Bool)

(assert (=> b!278187 (= res!141855 (= (seekEntryOrOpen!0 (select (arr!6573 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1731 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!278187 (=> (not res!141855) (not e!177445))))

(declare-fun b!278188 () Bool)

(assert (=> b!278188 (= e!177445 call!25374)))

(declare-fun b!278186 () Bool)

(assert (=> b!278186 (= e!177446 call!25374)))

(declare-fun d!64765 () Bool)

(declare-fun res!141856 () Bool)

(assert (=> d!64765 (=> res!141856 e!177444)))

(assert (=> d!64765 (= res!141856 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6925 a!3325)))))

(assert (=> d!64765 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!177444)))

(assert (= (and d!64765 (not res!141856)) b!278185))

(assert (= (and b!278185 c!45716) b!278187))

(assert (= (and b!278185 (not c!45716)) b!278186))

(assert (= (and b!278187 res!141855) b!278188))

(assert (= (or b!278188 b!278186) bm!25371))

(declare-fun m!293133 () Bool)

(assert (=> b!278185 m!293133))

(assert (=> b!278185 m!293133))

(declare-fun m!293135 () Bool)

(assert (=> b!278185 m!293135))

(declare-fun m!293137 () Bool)

(assert (=> bm!25371 m!293137))

(assert (=> b!278187 m!293133))

(declare-fun m!293139 () Bool)

(assert (=> b!278187 m!293139))

(declare-fun m!293141 () Bool)

(assert (=> b!278187 m!293141))

(assert (=> b!278187 m!293133))

(declare-fun m!293143 () Bool)

(assert (=> b!278187 m!293143))

(assert (=> bm!25348 d!64765))

(declare-fun d!64767 () Bool)

(assert (=> d!64767 (= (validKeyInArray!0 (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26))) (and (not (= (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278128 d!64767))

(declare-fun d!64769 () Bool)

(assert (=> d!64769 (= (validKeyInArray!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6573 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6573 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278092 d!64769))

(assert (=> b!277982 d!64769))

(declare-fun b!278189 () Bool)

(declare-fun e!177447 () SeekEntryResult!1731)

(assert (=> b!278189 (= e!177447 Undefined!1731)))

(declare-fun b!278190 () Bool)

(declare-fun e!177448 () SeekEntryResult!1731)

(declare-fun lt!138254 () SeekEntryResult!1731)

(assert (=> b!278190 (= e!177448 (Found!1731 (index!9096 lt!138254)))))

(declare-fun b!278191 () Bool)

(declare-fun e!177449 () SeekEntryResult!1731)

(assert (=> b!278191 (= e!177449 (MissingZero!1731 (index!9096 lt!138254)))))

(declare-fun b!278192 () Bool)

(assert (=> b!278192 (= e!177449 (seekKeyOrZeroReturnVacant!0 (x!27336 lt!138254) (index!9096 lt!138254) (index!9096 lt!138254) k0!2581 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) mask!3868))))

(declare-fun b!278193 () Bool)

(assert (=> b!278193 (= e!177447 e!177448)))

(declare-fun lt!138255 () (_ BitVec 64))

(assert (=> b!278193 (= lt!138255 (select (arr!6573 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325))) (index!9096 lt!138254)))))

(declare-fun c!45719 () Bool)

(assert (=> b!278193 (= c!45719 (= lt!138255 k0!2581))))

(declare-fun b!278194 () Bool)

(declare-fun c!45717 () Bool)

(assert (=> b!278194 (= c!45717 (= lt!138255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278194 (= e!177448 e!177449)))

(declare-fun lt!138256 () SeekEntryResult!1731)

(declare-fun d!64771 () Bool)

(assert (=> d!64771 (and (or ((_ is Undefined!1731) lt!138256) (not ((_ is Found!1731) lt!138256)) (and (bvsge (index!9095 lt!138256) #b00000000000000000000000000000000) (bvslt (index!9095 lt!138256) (size!6925 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)))))) (or ((_ is Undefined!1731) lt!138256) ((_ is Found!1731) lt!138256) (not ((_ is MissingZero!1731) lt!138256)) (and (bvsge (index!9094 lt!138256) #b00000000000000000000000000000000) (bvslt (index!9094 lt!138256) (size!6925 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)))))) (or ((_ is Undefined!1731) lt!138256) ((_ is Found!1731) lt!138256) ((_ is MissingZero!1731) lt!138256) (not ((_ is MissingVacant!1731) lt!138256)) (and (bvsge (index!9097 lt!138256) #b00000000000000000000000000000000) (bvslt (index!9097 lt!138256) (size!6925 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)))))) (or ((_ is Undefined!1731) lt!138256) (ite ((_ is Found!1731) lt!138256) (= (select (arr!6573 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325))) (index!9095 lt!138256)) k0!2581) (ite ((_ is MissingZero!1731) lt!138256) (= (select (arr!6573 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325))) (index!9094 lt!138256)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1731) lt!138256) (= (select (arr!6573 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325))) (index!9097 lt!138256)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64771 (= lt!138256 e!177447)))

(declare-fun c!45718 () Bool)

(assert (=> d!64771 (= c!45718 (and ((_ is Intermediate!1731) lt!138254) (undefined!2543 lt!138254)))))

(assert (=> d!64771 (= lt!138254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) mask!3868))))

(assert (=> d!64771 (validMask!0 mask!3868)))

(assert (=> d!64771 (= (seekEntryOrOpen!0 k0!2581 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) mask!3868) lt!138256)))

(assert (= (and d!64771 c!45718) b!278189))

(assert (= (and d!64771 (not c!45718)) b!278193))

(assert (= (and b!278193 c!45719) b!278190))

(assert (= (and b!278193 (not c!45719)) b!278194))

(assert (= (and b!278194 c!45717) b!278191))

(assert (= (and b!278194 (not c!45717)) b!278192))

(declare-fun m!293145 () Bool)

(assert (=> b!278192 m!293145))

(declare-fun m!293147 () Bool)

(assert (=> b!278193 m!293147))

(declare-fun m!293149 () Bool)

(assert (=> d!64771 m!293149))

(declare-fun m!293151 () Bool)

(assert (=> d!64771 m!293151))

(assert (=> d!64771 m!292961))

(declare-fun m!293153 () Bool)

(assert (=> d!64771 m!293153))

(assert (=> d!64771 m!292961))

(declare-fun m!293155 () Bool)

(assert (=> d!64771 m!293155))

(assert (=> d!64771 m!292845))

(assert (=> b!278066 d!64771))

(declare-fun b!278207 () Bool)

(declare-fun e!177457 () SeekEntryResult!1731)

(assert (=> b!278207 (= e!177457 Undefined!1731)))

(declare-fun b!278208 () Bool)

(declare-fun c!45728 () Bool)

(declare-fun lt!138261 () (_ BitVec 64))

(assert (=> b!278208 (= c!45728 (= lt!138261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177456 () SeekEntryResult!1731)

(declare-fun e!177458 () SeekEntryResult!1731)

(assert (=> b!278208 (= e!177456 e!177458)))

(declare-fun d!64773 () Bool)

(declare-fun lt!138262 () SeekEntryResult!1731)

(assert (=> d!64773 (and (or ((_ is Undefined!1731) lt!138262) (not ((_ is Found!1731) lt!138262)) (and (bvsge (index!9095 lt!138262) #b00000000000000000000000000000000) (bvslt (index!9095 lt!138262) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138262) ((_ is Found!1731) lt!138262) (not ((_ is MissingVacant!1731) lt!138262)) (not (= (index!9097 lt!138262) (index!9096 lt!138194))) (and (bvsge (index!9097 lt!138262) #b00000000000000000000000000000000) (bvslt (index!9097 lt!138262) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138262) (ite ((_ is Found!1731) lt!138262) (= (select (arr!6573 lt!138133) (index!9095 lt!138262)) k0!2581) (and ((_ is MissingVacant!1731) lt!138262) (= (index!9097 lt!138262) (index!9096 lt!138194)) (= (select (arr!6573 lt!138133) (index!9097 lt!138262)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!64773 (= lt!138262 e!177457)))

(declare-fun c!45727 () Bool)

(assert (=> d!64773 (= c!45727 (bvsge (x!27336 lt!138194) #b01111111111111111111111111111110))))

(assert (=> d!64773 (= lt!138261 (select (arr!6573 lt!138133) (index!9096 lt!138194)))))

(assert (=> d!64773 (validMask!0 mask!3868)))

(assert (=> d!64773 (= (seekKeyOrZeroReturnVacant!0 (x!27336 lt!138194) (index!9096 lt!138194) (index!9096 lt!138194) k0!2581 lt!138133 mask!3868) lt!138262)))

(declare-fun b!278209 () Bool)

(assert (=> b!278209 (= e!177458 (MissingVacant!1731 (index!9096 lt!138194)))))

(declare-fun b!278210 () Bool)

(assert (=> b!278210 (= e!177457 e!177456)))

(declare-fun c!45726 () Bool)

(assert (=> b!278210 (= c!45726 (= lt!138261 k0!2581))))

(declare-fun b!278211 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!278211 (= e!177458 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27336 lt!138194) #b00000000000000000000000000000001) (nextIndex!0 (index!9096 lt!138194) (x!27336 lt!138194) mask!3868) (index!9096 lt!138194) k0!2581 lt!138133 mask!3868))))

(declare-fun b!278212 () Bool)

(assert (=> b!278212 (= e!177456 (Found!1731 (index!9096 lt!138194)))))

(assert (= (and d!64773 c!45727) b!278207))

(assert (= (and d!64773 (not c!45727)) b!278210))

(assert (= (and b!278210 c!45726) b!278212))

(assert (= (and b!278210 (not c!45726)) b!278208))

(assert (= (and b!278208 c!45728) b!278209))

(assert (= (and b!278208 (not c!45728)) b!278211))

(declare-fun m!293157 () Bool)

(assert (=> d!64773 m!293157))

(declare-fun m!293159 () Bool)

(assert (=> d!64773 m!293159))

(assert (=> d!64773 m!292981))

(assert (=> d!64773 m!292845))

(declare-fun m!293161 () Bool)

(assert (=> b!278211 m!293161))

(assert (=> b!278211 m!293161))

(declare-fun m!293163 () Bool)

(assert (=> b!278211 m!293163))

(assert (=> b!278057 d!64773))

(declare-fun b!278213 () Bool)

(declare-fun e!177459 () Bool)

(declare-fun e!177461 () Bool)

(assert (=> b!278213 (= e!177459 e!177461)))

(declare-fun c!45729 () Bool)

(assert (=> b!278213 (= c!45729 (validKeyInArray!0 (select (arr!6573 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun call!25375 () Bool)

(declare-fun bm!25372 () Bool)

(assert (=> bm!25372 (= call!25375 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) mask!3868))))

(declare-fun b!278215 () Bool)

(declare-fun e!177460 () Bool)

(assert (=> b!278215 (= e!177461 e!177460)))

(declare-fun lt!138264 () (_ BitVec 64))

(assert (=> b!278215 (= lt!138264 (select (arr!6573 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!138265 () Unit!8794)

(assert (=> b!278215 (= lt!138265 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) lt!138264 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!278215 (arrayContainsKey!0 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) lt!138264 #b00000000000000000000000000000000)))

(declare-fun lt!138263 () Unit!8794)

(assert (=> b!278215 (= lt!138263 lt!138265)))

(declare-fun res!141857 () Bool)

(assert (=> b!278215 (= res!141857 (= (seekEntryOrOpen!0 (select (arr!6573 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26)) (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) mask!3868) (Found!1731 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!278215 (=> (not res!141857) (not e!177460))))

(declare-fun b!278216 () Bool)

(assert (=> b!278216 (= e!177460 call!25375)))

(declare-fun b!278214 () Bool)

(assert (=> b!278214 (= e!177461 call!25375)))

(declare-fun d!64775 () Bool)

(declare-fun res!141858 () Bool)

(assert (=> d!64775 (=> res!141858 e!177459)))

(assert (=> d!64775 (= res!141858 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!6925 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)))))))

(assert (=> d!64775 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) mask!3868) e!177459)))

(assert (= (and d!64775 (not res!141858)) b!278213))

(assert (= (and b!278213 c!45729) b!278215))

(assert (= (and b!278213 (not c!45729)) b!278214))

(assert (= (and b!278215 res!141857) b!278216))

(assert (= (or b!278216 b!278214) bm!25372))

(declare-fun m!293165 () Bool)

(assert (=> b!278213 m!293165))

(assert (=> b!278213 m!293165))

(declare-fun m!293167 () Bool)

(assert (=> b!278213 m!293167))

(declare-fun m!293169 () Bool)

(assert (=> bm!25372 m!293169))

(assert (=> b!278215 m!293165))

(declare-fun m!293171 () Bool)

(assert (=> b!278215 m!293171))

(declare-fun m!293173 () Bool)

(assert (=> b!278215 m!293173))

(assert (=> b!278215 m!293165))

(declare-fun m!293175 () Bool)

(assert (=> b!278215 m!293175))

(assert (=> b!278127 d!64775))

(declare-fun d!64777 () Bool)

(assert (=> d!64777 (arrayContainsKey!0 a!3325 lt!138156 #b00000000000000000000000000000000)))

(declare-fun lt!138268 () Unit!8794)

(declare-fun choose!13 (array!13847 (_ BitVec 64) (_ BitVec 32)) Unit!8794)

(assert (=> d!64777 (= lt!138268 (choose!13 a!3325 lt!138156 #b00000000000000000000000000000000))))

(assert (=> d!64777 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!64777 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138156 #b00000000000000000000000000000000) lt!138268)))

(declare-fun bs!9912 () Bool)

(assert (= bs!9912 d!64777))

(assert (=> bs!9912 m!292905))

(declare-fun m!293177 () Bool)

(assert (=> bs!9912 m!293177))

(assert (=> b!277984 d!64777))

(declare-fun d!64779 () Bool)

(declare-fun res!141859 () Bool)

(declare-fun e!177462 () Bool)

(assert (=> d!64779 (=> res!141859 e!177462)))

(assert (=> d!64779 (= res!141859 (= (select (arr!6573 a!3325) #b00000000000000000000000000000000) lt!138156))))

(assert (=> d!64779 (= (arrayContainsKey!0 a!3325 lt!138156 #b00000000000000000000000000000000) e!177462)))

(declare-fun b!278217 () Bool)

(declare-fun e!177463 () Bool)

(assert (=> b!278217 (= e!177462 e!177463)))

(declare-fun res!141860 () Bool)

(assert (=> b!278217 (=> (not res!141860) (not e!177463))))

(assert (=> b!278217 (= res!141860 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6925 a!3325)))))

(declare-fun b!278218 () Bool)

(assert (=> b!278218 (= e!177463 (arrayContainsKey!0 a!3325 lt!138156 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64779 (not res!141859)) b!278217))

(assert (= (and b!278217 res!141860) b!278218))

(assert (=> d!64779 m!292897))

(declare-fun m!293179 () Bool)

(assert (=> b!278218 m!293179))

(assert (=> b!277984 d!64779))

(declare-fun b!278219 () Bool)

(declare-fun e!177464 () SeekEntryResult!1731)

(assert (=> b!278219 (= e!177464 Undefined!1731)))

(declare-fun b!278220 () Bool)

(declare-fun e!177465 () SeekEntryResult!1731)

(declare-fun lt!138269 () SeekEntryResult!1731)

(assert (=> b!278220 (= e!177465 (Found!1731 (index!9096 lt!138269)))))

(declare-fun b!278221 () Bool)

(declare-fun e!177466 () SeekEntryResult!1731)

(assert (=> b!278221 (= e!177466 (MissingZero!1731 (index!9096 lt!138269)))))

(declare-fun b!278222 () Bool)

(assert (=> b!278222 (= e!177466 (seekKeyOrZeroReturnVacant!0 (x!27336 lt!138269) (index!9096 lt!138269) (index!9096 lt!138269) (select (arr!6573 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(declare-fun b!278223 () Bool)

(assert (=> b!278223 (= e!177464 e!177465)))

(declare-fun lt!138270 () (_ BitVec 64))

(assert (=> b!278223 (= lt!138270 (select (arr!6573 a!3325) (index!9096 lt!138269)))))

(declare-fun c!45732 () Bool)

(assert (=> b!278223 (= c!45732 (= lt!138270 (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278224 () Bool)

(declare-fun c!45730 () Bool)

(assert (=> b!278224 (= c!45730 (= lt!138270 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278224 (= e!177465 e!177466)))

(declare-fun d!64781 () Bool)

(declare-fun lt!138271 () SeekEntryResult!1731)

(assert (=> d!64781 (and (or ((_ is Undefined!1731) lt!138271) (not ((_ is Found!1731) lt!138271)) (and (bvsge (index!9095 lt!138271) #b00000000000000000000000000000000) (bvslt (index!9095 lt!138271) (size!6925 a!3325)))) (or ((_ is Undefined!1731) lt!138271) ((_ is Found!1731) lt!138271) (not ((_ is MissingZero!1731) lt!138271)) (and (bvsge (index!9094 lt!138271) #b00000000000000000000000000000000) (bvslt (index!9094 lt!138271) (size!6925 a!3325)))) (or ((_ is Undefined!1731) lt!138271) ((_ is Found!1731) lt!138271) ((_ is MissingZero!1731) lt!138271) (not ((_ is MissingVacant!1731) lt!138271)) (and (bvsge (index!9097 lt!138271) #b00000000000000000000000000000000) (bvslt (index!9097 lt!138271) (size!6925 a!3325)))) (or ((_ is Undefined!1731) lt!138271) (ite ((_ is Found!1731) lt!138271) (= (select (arr!6573 a!3325) (index!9095 lt!138271)) (select (arr!6573 a!3325) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1731) lt!138271) (= (select (arr!6573 a!3325) (index!9094 lt!138271)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1731) lt!138271) (= (select (arr!6573 a!3325) (index!9097 lt!138271)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64781 (= lt!138271 e!177464)))

(declare-fun c!45731 () Bool)

(assert (=> d!64781 (= c!45731 (and ((_ is Intermediate!1731) lt!138269) (undefined!2543 lt!138269)))))

(assert (=> d!64781 (= lt!138269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000) mask!3868) (select (arr!6573 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (=> d!64781 (validMask!0 mask!3868)))

(assert (=> d!64781 (= (seekEntryOrOpen!0 (select (arr!6573 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) lt!138271)))

(assert (= (and d!64781 c!45731) b!278219))

(assert (= (and d!64781 (not c!45731)) b!278223))

(assert (= (and b!278223 c!45732) b!278220))

(assert (= (and b!278223 (not c!45732)) b!278224))

(assert (= (and b!278224 c!45730) b!278221))

(assert (= (and b!278224 (not c!45730)) b!278222))

(assert (=> b!278222 m!292897))

(declare-fun m!293181 () Bool)

(assert (=> b!278222 m!293181))

(declare-fun m!293183 () Bool)

(assert (=> b!278223 m!293183))

(declare-fun m!293185 () Bool)

(assert (=> d!64781 m!293185))

(declare-fun m!293187 () Bool)

(assert (=> d!64781 m!293187))

(declare-fun m!293189 () Bool)

(assert (=> d!64781 m!293189))

(assert (=> d!64781 m!292897))

(declare-fun m!293191 () Bool)

(assert (=> d!64781 m!293191))

(assert (=> d!64781 m!292897))

(assert (=> d!64781 m!293189))

(declare-fun m!293193 () Bool)

(assert (=> d!64781 m!293193))

(assert (=> d!64781 m!292845))

(assert (=> b!277984 d!64781))

(declare-fun b!278243 () Bool)

(declare-fun lt!138276 () SeekEntryResult!1731)

(assert (=> b!278243 (and (bvsge (index!9096 lt!138276) #b00000000000000000000000000000000) (bvslt (index!9096 lt!138276) (size!6925 lt!138133)))))

(declare-fun res!141867 () Bool)

(assert (=> b!278243 (= res!141867 (= (select (arr!6573 lt!138133) (index!9096 lt!138276)) k0!2581))))

(declare-fun e!177480 () Bool)

(assert (=> b!278243 (=> res!141867 e!177480)))

(declare-fun e!177477 () Bool)

(assert (=> b!278243 (= e!177477 e!177480)))

(declare-fun b!278244 () Bool)

(declare-fun e!177479 () SeekEntryResult!1731)

(assert (=> b!278244 (= e!177479 (Intermediate!1731 false (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278245 () Bool)

(declare-fun e!177481 () Bool)

(assert (=> b!278245 (= e!177481 e!177477)))

(declare-fun res!141868 () Bool)

(assert (=> b!278245 (= res!141868 (and ((_ is Intermediate!1731) lt!138276) (not (undefined!2543 lt!138276)) (bvslt (x!27336 lt!138276) #b01111111111111111111111111111110) (bvsge (x!27336 lt!138276) #b00000000000000000000000000000000) (bvsge (x!27336 lt!138276) #b00000000000000000000000000000000)))))

(assert (=> b!278245 (=> (not res!141868) (not e!177477))))

(declare-fun d!64783 () Bool)

(assert (=> d!64783 e!177481))

(declare-fun c!45741 () Bool)

(assert (=> d!64783 (= c!45741 (and ((_ is Intermediate!1731) lt!138276) (undefined!2543 lt!138276)))))

(declare-fun e!177478 () SeekEntryResult!1731)

(assert (=> d!64783 (= lt!138276 e!177478)))

(declare-fun c!45739 () Bool)

(assert (=> d!64783 (= c!45739 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!138277 () (_ BitVec 64))

(assert (=> d!64783 (= lt!138277 (select (arr!6573 lt!138133) (toIndex!0 k0!2581 mask!3868)))))

(assert (=> d!64783 (validMask!0 mask!3868)))

(assert (=> d!64783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 lt!138133 mask!3868) lt!138276)))

(declare-fun b!278246 () Bool)

(assert (=> b!278246 (= e!177478 e!177479)))

(declare-fun c!45740 () Bool)

(assert (=> b!278246 (= c!45740 (or (= lt!138277 k0!2581) (= (bvadd lt!138277 lt!138277) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!278247 () Bool)

(assert (=> b!278247 (= e!177479 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000 mask!3868) k0!2581 lt!138133 mask!3868))))

(declare-fun b!278248 () Bool)

(assert (=> b!278248 (= e!177481 (bvsge (x!27336 lt!138276) #b01111111111111111111111111111110))))

(declare-fun b!278249 () Bool)

(assert (=> b!278249 (= e!177478 (Intermediate!1731 true (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278250 () Bool)

(assert (=> b!278250 (and (bvsge (index!9096 lt!138276) #b00000000000000000000000000000000) (bvslt (index!9096 lt!138276) (size!6925 lt!138133)))))

(declare-fun res!141869 () Bool)

(assert (=> b!278250 (= res!141869 (= (select (arr!6573 lt!138133) (index!9096 lt!138276)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278250 (=> res!141869 e!177480)))

(declare-fun b!278251 () Bool)

(assert (=> b!278251 (and (bvsge (index!9096 lt!138276) #b00000000000000000000000000000000) (bvslt (index!9096 lt!138276) (size!6925 lt!138133)))))

(assert (=> b!278251 (= e!177480 (= (select (arr!6573 lt!138133) (index!9096 lt!138276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64783 c!45739) b!278249))

(assert (= (and d!64783 (not c!45739)) b!278246))

(assert (= (and b!278246 c!45740) b!278244))

(assert (= (and b!278246 (not c!45740)) b!278247))

(assert (= (and d!64783 c!45741) b!278248))

(assert (= (and d!64783 (not c!45741)) b!278245))

(assert (= (and b!278245 res!141868) b!278243))

(assert (= (and b!278243 (not res!141867)) b!278250))

(assert (= (and b!278250 (not res!141869)) b!278251))

(declare-fun m!293195 () Bool)

(assert (=> b!278250 m!293195))

(assert (=> d!64783 m!292961))

(declare-fun m!293197 () Bool)

(assert (=> d!64783 m!293197))

(assert (=> d!64783 m!292845))

(assert (=> b!278247 m!292961))

(declare-fun m!293199 () Bool)

(assert (=> b!278247 m!293199))

(assert (=> b!278247 m!293199))

(declare-fun m!293201 () Bool)

(assert (=> b!278247 m!293201))

(assert (=> b!278251 m!293195))

(assert (=> b!278243 m!293195))

(assert (=> d!64719 d!64783))

(declare-fun d!64785 () Bool)

(declare-fun lt!138286 () (_ BitVec 32))

(declare-fun lt!138285 () (_ BitVec 32))

(assert (=> d!64785 (= lt!138286 (bvmul (bvxor lt!138285 (bvlshr lt!138285 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!64785 (= lt!138285 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!64785 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!141870 (let ((h!5046 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27340 (bvmul (bvxor h!5046 (bvlshr h!5046 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27340 (bvlshr x!27340 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!141870 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!141870 #b00000000000000000000000000000000))))))

(assert (=> d!64785 (= (toIndex!0 k0!2581 mask!3868) (bvand (bvxor lt!138286 (bvlshr lt!138286 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!64719 d!64785))

(assert (=> d!64719 d!64691))

(declare-fun b!278258 () Bool)

(declare-fun lt!138287 () SeekEntryResult!1731)

(assert (=> b!278258 (and (bvsge (index!9096 lt!138287) #b00000000000000000000000000000000) (bvslt (index!9096 lt!138287) (size!6925 a!3325)))))

(declare-fun res!141871 () Bool)

(assert (=> b!278258 (= res!141871 (= (select (arr!6573 a!3325) (index!9096 lt!138287)) k0!2581))))

(declare-fun e!177488 () Bool)

(assert (=> b!278258 (=> res!141871 e!177488)))

(declare-fun e!177485 () Bool)

(assert (=> b!278258 (= e!177485 e!177488)))

(declare-fun b!278259 () Bool)

(declare-fun e!177487 () SeekEntryResult!1731)

(assert (=> b!278259 (= e!177487 (Intermediate!1731 false (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278260 () Bool)

(declare-fun e!177489 () Bool)

(assert (=> b!278260 (= e!177489 e!177485)))

(declare-fun res!141872 () Bool)

(assert (=> b!278260 (= res!141872 (and ((_ is Intermediate!1731) lt!138287) (not (undefined!2543 lt!138287)) (bvslt (x!27336 lt!138287) #b01111111111111111111111111111110) (bvsge (x!27336 lt!138287) #b00000000000000000000000000000000) (bvsge (x!27336 lt!138287) #b00000000000000000000000000000000)))))

(assert (=> b!278260 (=> (not res!141872) (not e!177485))))

(declare-fun d!64791 () Bool)

(assert (=> d!64791 e!177489))

(declare-fun c!45747 () Bool)

(assert (=> d!64791 (= c!45747 (and ((_ is Intermediate!1731) lt!138287) (undefined!2543 lt!138287)))))

(declare-fun e!177486 () SeekEntryResult!1731)

(assert (=> d!64791 (= lt!138287 e!177486)))

(declare-fun c!45745 () Bool)

(assert (=> d!64791 (= c!45745 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!138288 () (_ BitVec 64))

(assert (=> d!64791 (= lt!138288 (select (arr!6573 a!3325) (toIndex!0 k0!2581 mask!3868)))))

(assert (=> d!64791 (validMask!0 mask!3868)))

(assert (=> d!64791 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868) lt!138287)))

(declare-fun b!278261 () Bool)

(assert (=> b!278261 (= e!177486 e!177487)))

(declare-fun c!45746 () Bool)

(assert (=> b!278261 (= c!45746 (or (= lt!138288 k0!2581) (= (bvadd lt!138288 lt!138288) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!278262 () Bool)

(assert (=> b!278262 (= e!177487 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000 mask!3868) k0!2581 a!3325 mask!3868))))

(declare-fun b!278263 () Bool)

(assert (=> b!278263 (= e!177489 (bvsge (x!27336 lt!138287) #b01111111111111111111111111111110))))

(declare-fun b!278264 () Bool)

(assert (=> b!278264 (= e!177486 (Intermediate!1731 true (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278265 () Bool)

(assert (=> b!278265 (and (bvsge (index!9096 lt!138287) #b00000000000000000000000000000000) (bvslt (index!9096 lt!138287) (size!6925 a!3325)))))

(declare-fun res!141873 () Bool)

(assert (=> b!278265 (= res!141873 (= (select (arr!6573 a!3325) (index!9096 lt!138287)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278265 (=> res!141873 e!177488)))

(declare-fun b!278266 () Bool)

(assert (=> b!278266 (and (bvsge (index!9096 lt!138287) #b00000000000000000000000000000000) (bvslt (index!9096 lt!138287) (size!6925 a!3325)))))

(assert (=> b!278266 (= e!177488 (= (select (arr!6573 a!3325) (index!9096 lt!138287)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64791 c!45745) b!278264))

(assert (= (and d!64791 (not c!45745)) b!278261))

(assert (= (and b!278261 c!45746) b!278259))

(assert (= (and b!278261 (not c!45746)) b!278262))

(assert (= (and d!64791 c!45747) b!278263))

(assert (= (and d!64791 (not c!45747)) b!278260))

(assert (= (and b!278260 res!141872) b!278258))

(assert (= (and b!278258 (not res!141871)) b!278265))

(assert (= (and b!278265 (not res!141873)) b!278266))

(declare-fun m!293215 () Bool)

(assert (=> b!278265 m!293215))

(assert (=> d!64791 m!292961))

(declare-fun m!293217 () Bool)

(assert (=> d!64791 m!293217))

(assert (=> d!64791 m!292845))

(assert (=> b!278262 m!292961))

(assert (=> b!278262 m!293199))

(assert (=> b!278262 m!293199))

(declare-fun m!293219 () Bool)

(assert (=> b!278262 m!293219))

(assert (=> b!278266 m!293215))

(assert (=> b!278258 m!293215))

(assert (=> d!64703 d!64791))

(assert (=> d!64703 d!64785))

(assert (=> d!64703 d!64691))

(declare-fun d!64793 () Bool)

(assert (=> d!64793 (arrayContainsKey!0 lt!138133 lt!138228 #b00000000000000000000000000000000)))

(declare-fun lt!138291 () Unit!8794)

(assert (=> d!64793 (= lt!138291 (choose!13 lt!138133 lt!138228 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> d!64793 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))

(assert (=> d!64793 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138133 lt!138228 (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138291)))

(declare-fun bs!9913 () Bool)

(assert (= bs!9913 d!64793))

(assert (=> bs!9913 m!293053))

(declare-fun m!293221 () Bool)

(assert (=> bs!9913 m!293221))

(assert (=> b!278130 d!64793))

(declare-fun d!64795 () Bool)

(declare-fun res!141874 () Bool)

(declare-fun e!177490 () Bool)

(assert (=> d!64795 (=> res!141874 e!177490)))

(assert (=> d!64795 (= res!141874 (= (select (arr!6573 lt!138133) #b00000000000000000000000000000000) lt!138228))))

(assert (=> d!64795 (= (arrayContainsKey!0 lt!138133 lt!138228 #b00000000000000000000000000000000) e!177490)))

(declare-fun b!278267 () Bool)

(declare-fun e!177491 () Bool)

(assert (=> b!278267 (= e!177490 e!177491)))

(declare-fun res!141875 () Bool)

(assert (=> b!278267 (=> (not res!141875) (not e!177491))))

(assert (=> b!278267 (= res!141875 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6925 lt!138133)))))

(declare-fun b!278268 () Bool)

(assert (=> b!278268 (= e!177491 (arrayContainsKey!0 lt!138133 lt!138228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64795 (not res!141874)) b!278267))

(assert (= (and b!278267 res!141875) b!278268))

(declare-fun m!293225 () Bool)

(assert (=> d!64795 m!293225))

(declare-fun m!293227 () Bool)

(assert (=> b!278268 m!293227))

(assert (=> b!278130 d!64795))

(declare-fun b!278271 () Bool)

(declare-fun e!177494 () SeekEntryResult!1731)

(assert (=> b!278271 (= e!177494 Undefined!1731)))

(declare-fun b!278272 () Bool)

(declare-fun e!177495 () SeekEntryResult!1731)

(declare-fun lt!138293 () SeekEntryResult!1731)

(assert (=> b!278272 (= e!177495 (Found!1731 (index!9096 lt!138293)))))

(declare-fun b!278273 () Bool)

(declare-fun e!177496 () SeekEntryResult!1731)

(assert (=> b!278273 (= e!177496 (MissingZero!1731 (index!9096 lt!138293)))))

(declare-fun b!278274 () Bool)

(assert (=> b!278274 (= e!177496 (seekKeyOrZeroReturnVacant!0 (x!27336 lt!138293) (index!9096 lt!138293) (index!9096 lt!138293) (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138133 mask!3868))))

(declare-fun b!278275 () Bool)

(assert (=> b!278275 (= e!177494 e!177495)))

(declare-fun lt!138294 () (_ BitVec 64))

(assert (=> b!278275 (= lt!138294 (select (arr!6573 lt!138133) (index!9096 lt!138293)))))

(declare-fun c!45750 () Bool)

(assert (=> b!278275 (= c!45750 (= lt!138294 (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun b!278276 () Bool)

(declare-fun c!45748 () Bool)

(assert (=> b!278276 (= c!45748 (= lt!138294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278276 (= e!177495 e!177496)))

(declare-fun d!64799 () Bool)

(declare-fun lt!138295 () SeekEntryResult!1731)

(assert (=> d!64799 (and (or ((_ is Undefined!1731) lt!138295) (not ((_ is Found!1731) lt!138295)) (and (bvsge (index!9095 lt!138295) #b00000000000000000000000000000000) (bvslt (index!9095 lt!138295) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138295) ((_ is Found!1731) lt!138295) (not ((_ is MissingZero!1731) lt!138295)) (and (bvsge (index!9094 lt!138295) #b00000000000000000000000000000000) (bvslt (index!9094 lt!138295) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138295) ((_ is Found!1731) lt!138295) ((_ is MissingZero!1731) lt!138295) (not ((_ is MissingVacant!1731) lt!138295)) (and (bvsge (index!9097 lt!138295) #b00000000000000000000000000000000) (bvslt (index!9097 lt!138295) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138295) (ite ((_ is Found!1731) lt!138295) (= (select (arr!6573 lt!138133) (index!9095 lt!138295)) (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26))) (ite ((_ is MissingZero!1731) lt!138295) (= (select (arr!6573 lt!138133) (index!9094 lt!138295)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1731) lt!138295) (= (select (arr!6573 lt!138133) (index!9097 lt!138295)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64799 (= lt!138295 e!177494)))

(declare-fun c!45749 () Bool)

(assert (=> d!64799 (= c!45749 (and ((_ is Intermediate!1731) lt!138293) (undefined!2543 lt!138293)))))

(assert (=> d!64799 (= lt!138293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26)) mask!3868) (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138133 mask!3868))))

(assert (=> d!64799 (validMask!0 mask!3868)))

(assert (=> d!64799 (= (seekEntryOrOpen!0 (select (arr!6573 lt!138133) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138133 mask!3868) lt!138295)))

(assert (= (and d!64799 c!45749) b!278271))

(assert (= (and d!64799 (not c!45749)) b!278275))

(assert (= (and b!278275 c!45750) b!278272))

(assert (= (and b!278275 (not c!45750)) b!278276))

(assert (= (and b!278276 c!45748) b!278273))

(assert (= (and b!278276 (not c!45748)) b!278274))

(assert (=> b!278274 m!293045))

(declare-fun m!293231 () Bool)

(assert (=> b!278274 m!293231))

(declare-fun m!293233 () Bool)

(assert (=> b!278275 m!293233))

(declare-fun m!293235 () Bool)

(assert (=> d!64799 m!293235))

(declare-fun m!293237 () Bool)

(assert (=> d!64799 m!293237))

(declare-fun m!293239 () Bool)

(assert (=> d!64799 m!293239))

(assert (=> d!64799 m!293045))

(declare-fun m!293241 () Bool)

(assert (=> d!64799 m!293241))

(assert (=> d!64799 m!293045))

(assert (=> d!64799 m!293239))

(declare-fun m!293243 () Bool)

(assert (=> d!64799 m!293243))

(assert (=> d!64799 m!292845))

(assert (=> b!278130 d!64799))

(declare-fun d!64803 () Bool)

(declare-fun lt!138304 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!184 (List!4381) (InoxSet (_ BitVec 64)))

(assert (=> d!64803 (= lt!138304 (select (content!184 Nil!4378) (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(declare-fun e!177510 () Bool)

(assert (=> d!64803 (= lt!138304 e!177510)))

(declare-fun res!141886 () Bool)

(assert (=> d!64803 (=> (not res!141886) (not e!177510))))

(assert (=> d!64803 (= res!141886 ((_ is Cons!4377) Nil!4378))))

(assert (=> d!64803 (= (contains!1962 Nil!4378 (select (arr!6573 a!3325) #b00000000000000000000000000000000)) lt!138304)))

(declare-fun b!278293 () Bool)

(declare-fun e!177509 () Bool)

(assert (=> b!278293 (= e!177510 e!177509)))

(declare-fun res!141887 () Bool)

(assert (=> b!278293 (=> res!141887 e!177509)))

(assert (=> b!278293 (= res!141887 (= (h!5044 Nil!4378) (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278294 () Bool)

(assert (=> b!278294 (= e!177509 (contains!1962 (t!9463 Nil!4378) (select (arr!6573 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64803 res!141886) b!278293))

(assert (= (and b!278293 (not res!141887)) b!278294))

(declare-fun m!293275 () Bool)

(assert (=> d!64803 m!293275))

(assert (=> d!64803 m!292897))

(declare-fun m!293277 () Bool)

(assert (=> d!64803 m!293277))

(assert (=> b!278294 m!292897))

(declare-fun m!293279 () Bool)

(assert (=> b!278294 m!293279))

(assert (=> b!278089 d!64803))

(declare-fun b!278295 () Bool)

(declare-fun e!177511 () Bool)

(declare-fun e!177513 () Bool)

(assert (=> b!278295 (= e!177511 e!177513)))

(declare-fun c!45755 () Bool)

(assert (=> b!278295 (= c!45755 (validKeyInArray!0 (select (arr!6573 lt!138133) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun bm!25374 () Bool)

(declare-fun call!25377 () Bool)

(assert (=> bm!25374 (= call!25377 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!138133 mask!3868))))

(declare-fun b!278297 () Bool)

(declare-fun e!177512 () Bool)

(assert (=> b!278297 (= e!177513 e!177512)))

(declare-fun lt!138306 () (_ BitVec 64))

(assert (=> b!278297 (= lt!138306 (select (arr!6573 lt!138133) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!138307 () Unit!8794)

(assert (=> b!278297 (= lt!138307 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138133 lt!138306 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!278297 (arrayContainsKey!0 lt!138133 lt!138306 #b00000000000000000000000000000000)))

(declare-fun lt!138305 () Unit!8794)

(assert (=> b!278297 (= lt!138305 lt!138307)))

(declare-fun res!141888 () Bool)

(assert (=> b!278297 (= res!141888 (= (seekEntryOrOpen!0 (select (arr!6573 lt!138133) (bvadd startIndex!26 #b00000000000000000000000000000001)) lt!138133 mask!3868) (Found!1731 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!278297 (=> (not res!141888) (not e!177512))))

(declare-fun b!278298 () Bool)

(assert (=> b!278298 (= e!177512 call!25377)))

(declare-fun b!278296 () Bool)

(assert (=> b!278296 (= e!177513 call!25377)))

(declare-fun d!64813 () Bool)

(declare-fun res!141889 () Bool)

(assert (=> d!64813 (=> res!141889 e!177511)))

(assert (=> d!64813 (= res!141889 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!6925 lt!138133)))))

(assert (=> d!64813 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!138133 mask!3868) e!177511)))

(assert (= (and d!64813 (not res!141889)) b!278295))

(assert (= (and b!278295 c!45755) b!278297))

(assert (= (and b!278295 (not c!45755)) b!278296))

(assert (= (and b!278297 res!141888) b!278298))

(assert (= (or b!278298 b!278296) bm!25374))

(declare-fun m!293281 () Bool)

(assert (=> b!278295 m!293281))

(assert (=> b!278295 m!293281))

(declare-fun m!293283 () Bool)

(assert (=> b!278295 m!293283))

(declare-fun m!293285 () Bool)

(assert (=> bm!25374 m!293285))

(assert (=> b!278297 m!293281))

(declare-fun m!293287 () Bool)

(assert (=> b!278297 m!293287))

(declare-fun m!293289 () Bool)

(assert (=> b!278297 m!293289))

(assert (=> b!278297 m!293281))

(declare-fun m!293291 () Bool)

(assert (=> b!278297 m!293291))

(assert (=> bm!25359 d!64813))

(declare-fun d!64815 () Bool)

(assert (=> d!64815 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) mask!3868)))

(assert (=> d!64815 true))

(declare-fun _$55!33 () Unit!8794)

(assert (=> d!64815 (= (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) _$55!33)))

(declare-fun bs!9915 () Bool)

(assert (= bs!9915 d!64815))

(assert (=> bs!9915 m!292859))

(assert (=> bs!9915 m!293043))

(assert (=> d!64737 d!64815))

(assert (=> d!64737 d!64691))

(declare-fun d!64817 () Bool)

(assert (=> d!64817 (= (validKeyInArray!0 (select (arr!6573 lt!138133) startIndex!26)) (and (not (= (select (arr!6573 lt!138133) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6573 lt!138133) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278050 d!64817))

(declare-fun d!64819 () Bool)

(assert (=> d!64819 (= (seekEntryOrOpen!0 k0!2581 (array!13848 (store (arr!6573 a!3325) i!1267 k0!2581) (size!6925 a!3325)) mask!3868) (Found!1731 i!1267))))

(assert (=> d!64819 true))

(declare-fun _$54!17 () Unit!8794)

(assert (=> d!64819 (= (choose!8 a!3325 i!1267 k0!2581 mask!3868) _$54!17)))

(declare-fun bs!9916 () Bool)

(assert (= bs!9916 d!64819))

(assert (=> bs!9916 m!292859))

(assert (=> bs!9916 m!293005))

(assert (=> d!64721 d!64819))

(assert (=> d!64721 d!64691))

(declare-fun b!278299 () Bool)

(declare-fun e!177515 () Bool)

(assert (=> b!278299 (= e!177515 (contains!1962 (ite c!45690 (Cons!4377 (select (arr!6573 a!3325) #b00000000000000000000000000000000) Nil!4378) Nil!4378) (select (arr!6573 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!278300 () Bool)

(declare-fun e!177517 () Bool)

(declare-fun call!25378 () Bool)

(assert (=> b!278300 (= e!177517 call!25378)))

(declare-fun b!278301 () Bool)

(declare-fun e!177516 () Bool)

(declare-fun e!177514 () Bool)

(assert (=> b!278301 (= e!177516 e!177514)))

(declare-fun res!141890 () Bool)

(assert (=> b!278301 (=> (not res!141890) (not e!177514))))

(assert (=> b!278301 (= res!141890 (not e!177515))))

(declare-fun res!141892 () Bool)

(assert (=> b!278301 (=> (not res!141892) (not e!177515))))

(assert (=> b!278301 (= res!141892 (validKeyInArray!0 (select (arr!6573 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25375 () Bool)

(declare-fun c!45756 () Bool)

(assert (=> bm!25375 (= call!25378 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45756 (Cons!4377 (select (arr!6573 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!45690 (Cons!4377 (select (arr!6573 a!3325) #b00000000000000000000000000000000) Nil!4378) Nil!4378)) (ite c!45690 (Cons!4377 (select (arr!6573 a!3325) #b00000000000000000000000000000000) Nil!4378) Nil!4378))))))

(declare-fun b!278302 () Bool)

(assert (=> b!278302 (= e!177514 e!177517)))

(assert (=> b!278302 (= c!45756 (validKeyInArray!0 (select (arr!6573 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!64821 () Bool)

(declare-fun res!141891 () Bool)

(assert (=> d!64821 (=> res!141891 e!177516)))

(assert (=> d!64821 (= res!141891 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6925 a!3325)))))

(assert (=> d!64821 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45690 (Cons!4377 (select (arr!6573 a!3325) #b00000000000000000000000000000000) Nil!4378) Nil!4378)) e!177516)))

(declare-fun b!278303 () Bool)

(assert (=> b!278303 (= e!177517 call!25378)))

(assert (= (and d!64821 (not res!141891)) b!278301))

(assert (= (and b!278301 res!141892) b!278299))

(assert (= (and b!278301 res!141890) b!278302))

(assert (= (and b!278302 c!45756) b!278303))

(assert (= (and b!278302 (not c!45756)) b!278300))

(assert (= (or b!278303 b!278300) bm!25375))

(assert (=> b!278299 m!293133))

(assert (=> b!278299 m!293133))

(declare-fun m!293293 () Bool)

(assert (=> b!278299 m!293293))

(assert (=> b!278301 m!293133))

(assert (=> b!278301 m!293133))

(assert (=> b!278301 m!293135))

(assert (=> bm!25375 m!293133))

(declare-fun m!293295 () Bool)

(assert (=> bm!25375 m!293295))

(assert (=> b!278302 m!293133))

(assert (=> b!278302 m!293133))

(assert (=> b!278302 m!293135))

(assert (=> bm!25363 d!64821))

(declare-fun d!64823 () Bool)

(declare-fun res!141893 () Bool)

(declare-fun e!177518 () Bool)

(assert (=> d!64823 (=> res!141893 e!177518)))

(assert (=> d!64823 (= res!141893 (= (select (arr!6573 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2581))))

(assert (=> d!64823 (= (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!177518)))

(declare-fun b!278304 () Bool)

(declare-fun e!177519 () Bool)

(assert (=> b!278304 (= e!177518 e!177519)))

(declare-fun res!141894 () Bool)

(assert (=> b!278304 (=> (not res!141894) (not e!177519))))

(assert (=> b!278304 (= res!141894 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6925 a!3325)))))

(declare-fun b!278305 () Bool)

(assert (=> b!278305 (= e!177519 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!64823 (not res!141893)) b!278304))

(assert (= (and b!278304 res!141894) b!278305))

(assert (=> d!64823 m!293133))

(declare-fun m!293297 () Bool)

(assert (=> b!278305 m!293297))

(assert (=> b!278105 d!64823))

(assert (=> b!278091 d!64769))

(declare-fun b!278306 () Bool)

(declare-fun e!177521 () SeekEntryResult!1731)

(assert (=> b!278306 (= e!177521 Undefined!1731)))

(declare-fun b!278307 () Bool)

(declare-fun c!45759 () Bool)

(declare-fun lt!138308 () (_ BitVec 64))

(assert (=> b!278307 (= c!45759 (= lt!138308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177520 () SeekEntryResult!1731)

(declare-fun e!177522 () SeekEntryResult!1731)

(assert (=> b!278307 (= e!177520 e!177522)))

(declare-fun d!64825 () Bool)

(declare-fun lt!138309 () SeekEntryResult!1731)

(assert (=> d!64825 (and (or ((_ is Undefined!1731) lt!138309) (not ((_ is Found!1731) lt!138309)) (and (bvsge (index!9095 lt!138309) #b00000000000000000000000000000000) (bvslt (index!9095 lt!138309) (size!6925 a!3325)))) (or ((_ is Undefined!1731) lt!138309) ((_ is Found!1731) lt!138309) (not ((_ is MissingVacant!1731) lt!138309)) (not (= (index!9097 lt!138309) (index!9096 lt!138188))) (and (bvsge (index!9097 lt!138309) #b00000000000000000000000000000000) (bvslt (index!9097 lt!138309) (size!6925 a!3325)))) (or ((_ is Undefined!1731) lt!138309) (ite ((_ is Found!1731) lt!138309) (= (select (arr!6573 a!3325) (index!9095 lt!138309)) k0!2581) (and ((_ is MissingVacant!1731) lt!138309) (= (index!9097 lt!138309) (index!9096 lt!138188)) (= (select (arr!6573 a!3325) (index!9097 lt!138309)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!64825 (= lt!138309 e!177521)))

(declare-fun c!45758 () Bool)

(assert (=> d!64825 (= c!45758 (bvsge (x!27336 lt!138188) #b01111111111111111111111111111110))))

(assert (=> d!64825 (= lt!138308 (select (arr!6573 a!3325) (index!9096 lt!138188)))))

(assert (=> d!64825 (validMask!0 mask!3868)))

(assert (=> d!64825 (= (seekKeyOrZeroReturnVacant!0 (x!27336 lt!138188) (index!9096 lt!138188) (index!9096 lt!138188) k0!2581 a!3325 mask!3868) lt!138309)))

(declare-fun b!278308 () Bool)

(assert (=> b!278308 (= e!177522 (MissingVacant!1731 (index!9096 lt!138188)))))

(declare-fun b!278309 () Bool)

(assert (=> b!278309 (= e!177521 e!177520)))

(declare-fun c!45757 () Bool)

(assert (=> b!278309 (= c!45757 (= lt!138308 k0!2581))))

(declare-fun b!278310 () Bool)

(assert (=> b!278310 (= e!177522 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27336 lt!138188) #b00000000000000000000000000000001) (nextIndex!0 (index!9096 lt!138188) (x!27336 lt!138188) mask!3868) (index!9096 lt!138188) k0!2581 a!3325 mask!3868))))

(declare-fun b!278311 () Bool)

(assert (=> b!278311 (= e!177520 (Found!1731 (index!9096 lt!138188)))))

(assert (= (and d!64825 c!45758) b!278306))

(assert (= (and d!64825 (not c!45758)) b!278309))

(assert (= (and b!278309 c!45757) b!278311))

(assert (= (and b!278309 (not c!45757)) b!278307))

(assert (= (and b!278307 c!45759) b!278308))

(assert (= (and b!278307 (not c!45759)) b!278310))

(declare-fun m!293299 () Bool)

(assert (=> d!64825 m!293299))

(declare-fun m!293301 () Bool)

(assert (=> d!64825 m!293301))

(assert (=> d!64825 m!292955))

(assert (=> d!64825 m!292845))

(declare-fun m!293303 () Bool)

(assert (=> b!278310 m!293303))

(assert (=> b!278310 m!293303))

(declare-fun m!293305 () Bool)

(assert (=> b!278310 m!293305))

(assert (=> b!278047 d!64825))

(declare-fun d!64827 () Bool)

(assert (=> d!64827 (arrayContainsKey!0 lt!138133 lt!138192 #b00000000000000000000000000000000)))

(declare-fun lt!138310 () Unit!8794)

(assert (=> d!64827 (= lt!138310 (choose!13 lt!138133 lt!138192 startIndex!26))))

(assert (=> d!64827 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!64827 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138133 lt!138192 startIndex!26) lt!138310)))

(declare-fun bs!9917 () Bool)

(assert (= bs!9917 d!64827))

(assert (=> bs!9917 m!292975))

(declare-fun m!293307 () Bool)

(assert (=> bs!9917 m!293307))

(assert (=> b!278052 d!64827))

(declare-fun d!64829 () Bool)

(declare-fun res!141895 () Bool)

(declare-fun e!177523 () Bool)

(assert (=> d!64829 (=> res!141895 e!177523)))

(assert (=> d!64829 (= res!141895 (= (select (arr!6573 lt!138133) #b00000000000000000000000000000000) lt!138192))))

(assert (=> d!64829 (= (arrayContainsKey!0 lt!138133 lt!138192 #b00000000000000000000000000000000) e!177523)))

(declare-fun b!278312 () Bool)

(declare-fun e!177524 () Bool)

(assert (=> b!278312 (= e!177523 e!177524)))

(declare-fun res!141896 () Bool)

(assert (=> b!278312 (=> (not res!141896) (not e!177524))))

(assert (=> b!278312 (= res!141896 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6925 lt!138133)))))

(declare-fun b!278313 () Bool)

(assert (=> b!278313 (= e!177524 (arrayContainsKey!0 lt!138133 lt!138192 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64829 (not res!141895)) b!278312))

(assert (= (and b!278312 res!141896) b!278313))

(assert (=> d!64829 m!293225))

(declare-fun m!293309 () Bool)

(assert (=> b!278313 m!293309))

(assert (=> b!278052 d!64829))

(declare-fun b!278314 () Bool)

(declare-fun e!177525 () SeekEntryResult!1731)

(assert (=> b!278314 (= e!177525 Undefined!1731)))

(declare-fun b!278315 () Bool)

(declare-fun e!177526 () SeekEntryResult!1731)

(declare-fun lt!138311 () SeekEntryResult!1731)

(assert (=> b!278315 (= e!177526 (Found!1731 (index!9096 lt!138311)))))

(declare-fun b!278316 () Bool)

(declare-fun e!177527 () SeekEntryResult!1731)

(assert (=> b!278316 (= e!177527 (MissingZero!1731 (index!9096 lt!138311)))))

(declare-fun b!278317 () Bool)

(assert (=> b!278317 (= e!177527 (seekKeyOrZeroReturnVacant!0 (x!27336 lt!138311) (index!9096 lt!138311) (index!9096 lt!138311) (select (arr!6573 lt!138133) startIndex!26) lt!138133 mask!3868))))

(declare-fun b!278318 () Bool)

(assert (=> b!278318 (= e!177525 e!177526)))

(declare-fun lt!138312 () (_ BitVec 64))

(assert (=> b!278318 (= lt!138312 (select (arr!6573 lt!138133) (index!9096 lt!138311)))))

(declare-fun c!45762 () Bool)

(assert (=> b!278318 (= c!45762 (= lt!138312 (select (arr!6573 lt!138133) startIndex!26)))))

(declare-fun b!278319 () Bool)

(declare-fun c!45760 () Bool)

(assert (=> b!278319 (= c!45760 (= lt!138312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278319 (= e!177526 e!177527)))

(declare-fun d!64831 () Bool)

(declare-fun lt!138313 () SeekEntryResult!1731)

(assert (=> d!64831 (and (or ((_ is Undefined!1731) lt!138313) (not ((_ is Found!1731) lt!138313)) (and (bvsge (index!9095 lt!138313) #b00000000000000000000000000000000) (bvslt (index!9095 lt!138313) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138313) ((_ is Found!1731) lt!138313) (not ((_ is MissingZero!1731) lt!138313)) (and (bvsge (index!9094 lt!138313) #b00000000000000000000000000000000) (bvslt (index!9094 lt!138313) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138313) ((_ is Found!1731) lt!138313) ((_ is MissingZero!1731) lt!138313) (not ((_ is MissingVacant!1731) lt!138313)) (and (bvsge (index!9097 lt!138313) #b00000000000000000000000000000000) (bvslt (index!9097 lt!138313) (size!6925 lt!138133)))) (or ((_ is Undefined!1731) lt!138313) (ite ((_ is Found!1731) lt!138313) (= (select (arr!6573 lt!138133) (index!9095 lt!138313)) (select (arr!6573 lt!138133) startIndex!26)) (ite ((_ is MissingZero!1731) lt!138313) (= (select (arr!6573 lt!138133) (index!9094 lt!138313)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1731) lt!138313) (= (select (arr!6573 lt!138133) (index!9097 lt!138313)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64831 (= lt!138313 e!177525)))

(declare-fun c!45761 () Bool)

(assert (=> d!64831 (= c!45761 (and ((_ is Intermediate!1731) lt!138311) (undefined!2543 lt!138311)))))

(assert (=> d!64831 (= lt!138311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6573 lt!138133) startIndex!26) mask!3868) (select (arr!6573 lt!138133) startIndex!26) lt!138133 mask!3868))))

(assert (=> d!64831 (validMask!0 mask!3868)))

(assert (=> d!64831 (= (seekEntryOrOpen!0 (select (arr!6573 lt!138133) startIndex!26) lt!138133 mask!3868) lt!138313)))

(assert (= (and d!64831 c!45761) b!278314))

(assert (= (and d!64831 (not c!45761)) b!278318))

(assert (= (and b!278318 c!45762) b!278315))

(assert (= (and b!278318 (not c!45762)) b!278319))

(assert (= (and b!278319 c!45760) b!278316))

(assert (= (and b!278319 (not c!45760)) b!278317))

(assert (=> b!278317 m!292967))

(declare-fun m!293311 () Bool)

(assert (=> b!278317 m!293311))

(declare-fun m!293313 () Bool)

(assert (=> b!278318 m!293313))

(declare-fun m!293315 () Bool)

(assert (=> d!64831 m!293315))

(declare-fun m!293317 () Bool)

(assert (=> d!64831 m!293317))

(declare-fun m!293319 () Bool)

(assert (=> d!64831 m!293319))

(assert (=> d!64831 m!292967))

(declare-fun m!293321 () Bool)

(assert (=> d!64831 m!293321))

(assert (=> d!64831 m!292967))

(assert (=> d!64831 m!293319))

(declare-fun m!293323 () Bool)

(assert (=> d!64831 m!293323))

(assert (=> d!64831 m!292845))

(assert (=> b!278052 d!64831))

(check-sat (not b!278317) (not bm!25371) (not b!278302) (not d!64773) (not d!64819) (not b!278310) (not d!64783) (not b!278301) (not b!278294) (not d!64777) (not b!278213) (not b!278268) (not b!278247) (not bm!25375) (not b!278187) (not b!278181) (not b!278215) (not d!64831) (not d!64771) (not b!278295) (not d!64799) (not b!278262) (not d!64791) (not b!278305) (not bm!25372) (not b!278299) (not b!278192) (not b!278183) (not b!278274) (not b!278297) (not b!278222) (not d!64825) (not d!64803) (not b!278313) (not d!64815) (not d!64793) (not d!64827) (not b!278218) (not d!64781) (not bm!25374) (not b!278211) (not bm!25370) (not b!278185))
(check-sat)
