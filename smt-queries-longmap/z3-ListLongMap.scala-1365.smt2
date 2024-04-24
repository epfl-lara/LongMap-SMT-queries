; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26748 () Bool)

(assert start!26748)

(declare-fun b!277945 () Bool)

(declare-fun e!177278 () Bool)

(declare-fun e!177280 () Bool)

(assert (=> b!277945 (= e!177278 e!177280)))

(declare-fun res!141727 () Bool)

(assert (=> b!277945 (=> (not res!141727) (not e!177280))))

(declare-datatypes ((SeekEntryResult!1694 0))(
  ( (MissingZero!1694 (index!8946 (_ BitVec 32))) (Found!1694 (index!8947 (_ BitVec 32))) (Intermediate!1694 (undefined!2506 Bool) (index!8948 (_ BitVec 32)) (x!27299 (_ BitVec 32))) (Undefined!1694) (MissingVacant!1694 (index!8949 (_ BitVec 32))) )
))
(declare-fun lt!138174 () SeekEntryResult!1694)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277945 (= res!141727 (or (= lt!138174 (MissingZero!1694 i!1267)) (= lt!138174 (MissingVacant!1694 i!1267))))))

(declare-datatypes ((array!13844 0))(
  ( (array!13845 (arr!6571 (Array (_ BitVec 32) (_ BitVec 64))) (size!6923 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13844)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13844 (_ BitVec 32)) SeekEntryResult!1694)

(assert (=> b!277945 (= lt!138174 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun lt!138176 () array!13844)

(declare-fun b!277946 () Bool)

(declare-fun e!177279 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13844 (_ BitVec 32)) Bool)

(assert (=> b!277946 (= e!177279 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!138176 mask!3868)))))

(assert (=> b!277946 (= (seekEntryOrOpen!0 k0!2581 lt!138176 mask!3868) (Found!1694 i!1267))))

(declare-datatypes ((Unit!8771 0))(
  ( (Unit!8772) )
))
(declare-fun lt!138173 () Unit!8771)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13844 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8771)

(assert (=> b!277946 (= lt!138173 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!138175 () Unit!8771)

(declare-fun e!177277 () Unit!8771)

(assert (=> b!277946 (= lt!138175 e!177277)))

(declare-fun c!45661 () Bool)

(assert (=> b!277946 (= c!45661 (bvslt startIndex!26 (bvsub (size!6923 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277947 () Bool)

(declare-fun res!141729 () Bool)

(assert (=> b!277947 (=> (not res!141729) (not e!177278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277947 (= res!141729 (validKeyInArray!0 k0!2581))))

(declare-fun b!277948 () Bool)

(assert (=> b!277948 (= e!177280 e!177279)))

(declare-fun res!141731 () Bool)

(assert (=> b!277948 (=> (not res!141731) (not e!177279))))

(assert (=> b!277948 (= res!141731 (= startIndex!26 i!1267))))

(assert (=> b!277948 (= lt!138176 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)))))

(declare-fun res!141732 () Bool)

(assert (=> start!26748 (=> (not res!141732) (not e!177278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26748 (= res!141732 (validMask!0 mask!3868))))

(assert (=> start!26748 e!177278))

(declare-fun array_inv!4521 (array!13844) Bool)

(assert (=> start!26748 (array_inv!4521 a!3325)))

(assert (=> start!26748 true))

(declare-fun b!277949 () Bool)

(declare-fun Unit!8773 () Unit!8771)

(assert (=> b!277949 (= e!177277 Unit!8773)))

(declare-fun b!277950 () Bool)

(declare-fun res!141730 () Bool)

(assert (=> b!277950 (=> (not res!141730) (not e!177278))))

(assert (=> b!277950 (= res!141730 (and (= (size!6923 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6923 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6923 a!3325))))))

(declare-fun b!277951 () Bool)

(declare-fun res!141726 () Bool)

(assert (=> b!277951 (=> (not res!141726) (not e!177278))))

(declare-datatypes ((List!4292 0))(
  ( (Nil!4289) (Cons!4288 (h!4955 (_ BitVec 64)) (t!9366 List!4292)) )
))
(declare-fun arrayNoDuplicates!0 (array!13844 (_ BitVec 32) List!4292) Bool)

(assert (=> b!277951 (= res!141726 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4289))))

(declare-fun b!277952 () Bool)

(declare-fun res!141725 () Bool)

(assert (=> b!277952 (=> (not res!141725) (not e!177280))))

(assert (=> b!277952 (= res!141725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277953 () Bool)

(declare-fun res!141728 () Bool)

(assert (=> b!277953 (=> (not res!141728) (not e!177278))))

(declare-fun arrayContainsKey!0 (array!13844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277953 (= res!141728 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277954 () Bool)

(declare-fun lt!138177 () Unit!8771)

(assert (=> b!277954 (= e!177277 lt!138177)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13844 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8771)

(assert (=> b!277954 (= lt!138177 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277954 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138176 mask!3868)))

(assert (= (and start!26748 res!141732) b!277950))

(assert (= (and b!277950 res!141730) b!277947))

(assert (= (and b!277947 res!141729) b!277951))

(assert (= (and b!277951 res!141726) b!277953))

(assert (= (and b!277953 res!141728) b!277945))

(assert (= (and b!277945 res!141727) b!277952))

(assert (= (and b!277952 res!141725) b!277948))

(assert (= (and b!277948 res!141731) b!277946))

(assert (= (and b!277946 c!45661) b!277954))

(assert (= (and b!277946 (not c!45661)) b!277949))

(declare-fun m!293021 () Bool)

(assert (=> b!277953 m!293021))

(declare-fun m!293023 () Bool)

(assert (=> b!277948 m!293023))

(declare-fun m!293025 () Bool)

(assert (=> b!277946 m!293025))

(declare-fun m!293027 () Bool)

(assert (=> b!277946 m!293027))

(declare-fun m!293029 () Bool)

(assert (=> b!277946 m!293029))

(declare-fun m!293031 () Bool)

(assert (=> b!277954 m!293031))

(declare-fun m!293033 () Bool)

(assert (=> b!277954 m!293033))

(declare-fun m!293035 () Bool)

(assert (=> b!277952 m!293035))

(declare-fun m!293037 () Bool)

(assert (=> b!277947 m!293037))

(declare-fun m!293039 () Bool)

(assert (=> b!277945 m!293039))

(declare-fun m!293041 () Bool)

(assert (=> b!277951 m!293041))

(declare-fun m!293043 () Bool)

(assert (=> start!26748 m!293043))

(declare-fun m!293045 () Bool)

(assert (=> start!26748 m!293045))

(check-sat (not b!277952) (not b!277946) (not b!277953) (not start!26748) (not b!277945) (not b!277947) (not b!277951) (not b!277954))
(check-sat)
(get-model)

(declare-fun bm!25336 () Bool)

(declare-fun call!25339 () Bool)

(assert (=> bm!25336 (= call!25339 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!278023 () Bool)

(declare-fun e!177318 () Bool)

(declare-fun e!177320 () Bool)

(assert (=> b!278023 (= e!177318 e!177320)))

(declare-fun lt!138214 () (_ BitVec 64))

(assert (=> b!278023 (= lt!138214 (select (arr!6571 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!138216 () Unit!8771)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13844 (_ BitVec 64) (_ BitVec 32)) Unit!8771)

(assert (=> b!278023 (= lt!138216 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138214 #b00000000000000000000000000000000))))

(assert (=> b!278023 (arrayContainsKey!0 a!3325 lt!138214 #b00000000000000000000000000000000)))

(declare-fun lt!138215 () Unit!8771)

(assert (=> b!278023 (= lt!138215 lt!138216)))

(declare-fun res!141785 () Bool)

(assert (=> b!278023 (= res!141785 (= (seekEntryOrOpen!0 (select (arr!6571 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1694 #b00000000000000000000000000000000)))))

(assert (=> b!278023 (=> (not res!141785) (not e!177320))))

(declare-fun b!278024 () Bool)

(assert (=> b!278024 (= e!177320 call!25339)))

(declare-fun b!278025 () Bool)

(assert (=> b!278025 (= e!177318 call!25339)))

(declare-fun b!278026 () Bool)

(declare-fun e!177319 () Bool)

(assert (=> b!278026 (= e!177319 e!177318)))

(declare-fun c!45670 () Bool)

(assert (=> b!278026 (= c!45670 (validKeyInArray!0 (select (arr!6571 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64761 () Bool)

(declare-fun res!141786 () Bool)

(assert (=> d!64761 (=> res!141786 e!177319)))

(assert (=> d!64761 (= res!141786 (bvsge #b00000000000000000000000000000000 (size!6923 a!3325)))))

(assert (=> d!64761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177319)))

(assert (= (and d!64761 (not res!141786)) b!278026))

(assert (= (and b!278026 c!45670) b!278023))

(assert (= (and b!278026 (not c!45670)) b!278025))

(assert (= (and b!278023 res!141785) b!278024))

(assert (= (or b!278024 b!278025) bm!25336))

(declare-fun m!293099 () Bool)

(assert (=> bm!25336 m!293099))

(declare-fun m!293101 () Bool)

(assert (=> b!278023 m!293101))

(declare-fun m!293103 () Bool)

(assert (=> b!278023 m!293103))

(declare-fun m!293105 () Bool)

(assert (=> b!278023 m!293105))

(assert (=> b!278023 m!293101))

(declare-fun m!293107 () Bool)

(assert (=> b!278023 m!293107))

(assert (=> b!278026 m!293101))

(assert (=> b!278026 m!293101))

(declare-fun m!293109 () Bool)

(assert (=> b!278026 m!293109))

(assert (=> b!277952 d!64761))

(declare-fun bm!25337 () Bool)

(declare-fun call!25340 () Bool)

(assert (=> bm!25337 (= call!25340 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!138176 mask!3868))))

(declare-fun b!278027 () Bool)

(declare-fun e!177321 () Bool)

(declare-fun e!177323 () Bool)

(assert (=> b!278027 (= e!177321 e!177323)))

(declare-fun lt!138217 () (_ BitVec 64))

(assert (=> b!278027 (= lt!138217 (select (arr!6571 lt!138176) startIndex!26))))

(declare-fun lt!138219 () Unit!8771)

(assert (=> b!278027 (= lt!138219 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138176 lt!138217 startIndex!26))))

(assert (=> b!278027 (arrayContainsKey!0 lt!138176 lt!138217 #b00000000000000000000000000000000)))

(declare-fun lt!138218 () Unit!8771)

(assert (=> b!278027 (= lt!138218 lt!138219)))

(declare-fun res!141787 () Bool)

(assert (=> b!278027 (= res!141787 (= (seekEntryOrOpen!0 (select (arr!6571 lt!138176) startIndex!26) lt!138176 mask!3868) (Found!1694 startIndex!26)))))

(assert (=> b!278027 (=> (not res!141787) (not e!177323))))

(declare-fun b!278028 () Bool)

(assert (=> b!278028 (= e!177323 call!25340)))

(declare-fun b!278029 () Bool)

(assert (=> b!278029 (= e!177321 call!25340)))

(declare-fun b!278030 () Bool)

(declare-fun e!177322 () Bool)

(assert (=> b!278030 (= e!177322 e!177321)))

(declare-fun c!45671 () Bool)

(assert (=> b!278030 (= c!45671 (validKeyInArray!0 (select (arr!6571 lt!138176) startIndex!26)))))

(declare-fun d!64763 () Bool)

(declare-fun res!141788 () Bool)

(assert (=> d!64763 (=> res!141788 e!177322)))

(assert (=> d!64763 (= res!141788 (bvsge startIndex!26 (size!6923 lt!138176)))))

(assert (=> d!64763 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!138176 mask!3868) e!177322)))

(assert (= (and d!64763 (not res!141788)) b!278030))

(assert (= (and b!278030 c!45671) b!278027))

(assert (= (and b!278030 (not c!45671)) b!278029))

(assert (= (and b!278027 res!141787) b!278028))

(assert (= (or b!278028 b!278029) bm!25337))

(declare-fun m!293111 () Bool)

(assert (=> bm!25337 m!293111))

(declare-fun m!293113 () Bool)

(assert (=> b!278027 m!293113))

(declare-fun m!293115 () Bool)

(assert (=> b!278027 m!293115))

(declare-fun m!293117 () Bool)

(assert (=> b!278027 m!293117))

(assert (=> b!278027 m!293113))

(declare-fun m!293119 () Bool)

(assert (=> b!278027 m!293119))

(assert (=> b!278030 m!293113))

(assert (=> b!278030 m!293113))

(declare-fun m!293121 () Bool)

(assert (=> b!278030 m!293121))

(assert (=> b!277946 d!64763))

(declare-fun d!64765 () Bool)

(declare-fun lt!138229 () SeekEntryResult!1694)

(get-info :version)

(assert (=> d!64765 (and (or ((_ is Undefined!1694) lt!138229) (not ((_ is Found!1694) lt!138229)) (and (bvsge (index!8947 lt!138229) #b00000000000000000000000000000000) (bvslt (index!8947 lt!138229) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138229) ((_ is Found!1694) lt!138229) (not ((_ is MissingZero!1694) lt!138229)) (and (bvsge (index!8946 lt!138229) #b00000000000000000000000000000000) (bvslt (index!8946 lt!138229) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138229) ((_ is Found!1694) lt!138229) ((_ is MissingZero!1694) lt!138229) (not ((_ is MissingVacant!1694) lt!138229)) (and (bvsge (index!8949 lt!138229) #b00000000000000000000000000000000) (bvslt (index!8949 lt!138229) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138229) (ite ((_ is Found!1694) lt!138229) (= (select (arr!6571 lt!138176) (index!8947 lt!138229)) k0!2581) (ite ((_ is MissingZero!1694) lt!138229) (= (select (arr!6571 lt!138176) (index!8946 lt!138229)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1694) lt!138229) (= (select (arr!6571 lt!138176) (index!8949 lt!138229)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!177352 () SeekEntryResult!1694)

(assert (=> d!64765 (= lt!138229 e!177352)))

(declare-fun c!45683 () Bool)

(declare-fun lt!138228 () SeekEntryResult!1694)

(assert (=> d!64765 (= c!45683 (and ((_ is Intermediate!1694) lt!138228) (undefined!2506 lt!138228)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13844 (_ BitVec 32)) SeekEntryResult!1694)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64765 (= lt!138228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 lt!138176 mask!3868))))

(assert (=> d!64765 (validMask!0 mask!3868)))

(assert (=> d!64765 (= (seekEntryOrOpen!0 k0!2581 lt!138176 mask!3868) lt!138229)))

(declare-fun b!278066 () Bool)

(declare-fun e!177351 () SeekEntryResult!1694)

(assert (=> b!278066 (= e!177351 (MissingZero!1694 (index!8948 lt!138228)))))

(declare-fun b!278067 () Bool)

(declare-fun e!177350 () SeekEntryResult!1694)

(assert (=> b!278067 (= e!177352 e!177350)))

(declare-fun lt!138230 () (_ BitVec 64))

(assert (=> b!278067 (= lt!138230 (select (arr!6571 lt!138176) (index!8948 lt!138228)))))

(declare-fun c!45681 () Bool)

(assert (=> b!278067 (= c!45681 (= lt!138230 k0!2581))))

(declare-fun b!278068 () Bool)

(declare-fun c!45682 () Bool)

(assert (=> b!278068 (= c!45682 (= lt!138230 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278068 (= e!177350 e!177351)))

(declare-fun b!278069 () Bool)

(assert (=> b!278069 (= e!177352 Undefined!1694)))

(declare-fun b!278070 () Bool)

(assert (=> b!278070 (= e!177350 (Found!1694 (index!8948 lt!138228)))))

(declare-fun b!278071 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13844 (_ BitVec 32)) SeekEntryResult!1694)

(assert (=> b!278071 (= e!177351 (seekKeyOrZeroReturnVacant!0 (x!27299 lt!138228) (index!8948 lt!138228) (index!8948 lt!138228) k0!2581 lt!138176 mask!3868))))

(assert (= (and d!64765 c!45683) b!278069))

(assert (= (and d!64765 (not c!45683)) b!278067))

(assert (= (and b!278067 c!45681) b!278070))

(assert (= (and b!278067 (not c!45681)) b!278068))

(assert (= (and b!278068 c!45682) b!278066))

(assert (= (and b!278068 (not c!45682)) b!278071))

(assert (=> d!64765 m!293043))

(declare-fun m!293133 () Bool)

(assert (=> d!64765 m!293133))

(declare-fun m!293135 () Bool)

(assert (=> d!64765 m!293135))

(assert (=> d!64765 m!293133))

(declare-fun m!293137 () Bool)

(assert (=> d!64765 m!293137))

(declare-fun m!293139 () Bool)

(assert (=> d!64765 m!293139))

(declare-fun m!293141 () Bool)

(assert (=> d!64765 m!293141))

(declare-fun m!293143 () Bool)

(assert (=> b!278067 m!293143))

(declare-fun m!293145 () Bool)

(assert (=> b!278071 m!293145))

(assert (=> b!277946 d!64765))

(declare-fun d!64773 () Bool)

(declare-fun e!177356 () Bool)

(assert (=> d!64773 e!177356))

(declare-fun res!141811 () Bool)

(assert (=> d!64773 (=> (not res!141811) (not e!177356))))

(assert (=> d!64773 (= res!141811 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6923 a!3325))))))

(declare-fun lt!138234 () Unit!8771)

(declare-fun choose!8 (array!13844 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8771)

(assert (=> d!64773 (= lt!138234 (choose!8 a!3325 i!1267 k0!2581 mask!3868))))

(assert (=> d!64773 (validMask!0 mask!3868)))

(assert (=> d!64773 (= (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868) lt!138234)))

(declare-fun b!278075 () Bool)

(assert (=> b!278075 (= e!177356 (= (seekEntryOrOpen!0 k0!2581 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) mask!3868) (Found!1694 i!1267)))))

(assert (= (and d!64773 res!141811) b!278075))

(declare-fun m!293151 () Bool)

(assert (=> d!64773 m!293151))

(assert (=> d!64773 m!293043))

(assert (=> b!278075 m!293023))

(declare-fun m!293153 () Bool)

(assert (=> b!278075 m!293153))

(assert (=> b!277946 d!64773))

(declare-fun b!278098 () Bool)

(declare-fun e!177374 () Bool)

(declare-fun contains!1937 (List!4292 (_ BitVec 64)) Bool)

(assert (=> b!278098 (= e!177374 (contains!1937 Nil!4289 (select (arr!6571 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278099 () Bool)

(declare-fun e!177377 () Bool)

(declare-fun e!177376 () Bool)

(assert (=> b!278099 (= e!177377 e!177376)))

(declare-fun c!45689 () Bool)

(assert (=> b!278099 (= c!45689 (validKeyInArray!0 (select (arr!6571 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25346 () Bool)

(declare-fun call!25349 () Bool)

(assert (=> bm!25346 (= call!25349 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45689 (Cons!4288 (select (arr!6571 a!3325) #b00000000000000000000000000000000) Nil!4289) Nil!4289)))))

(declare-fun b!278100 () Bool)

(assert (=> b!278100 (= e!177376 call!25349)))

(declare-fun b!278102 () Bool)

(declare-fun e!177375 () Bool)

(assert (=> b!278102 (= e!177375 e!177377)))

(declare-fun res!141824 () Bool)

(assert (=> b!278102 (=> (not res!141824) (not e!177377))))

(assert (=> b!278102 (= res!141824 (not e!177374))))

(declare-fun res!141823 () Bool)

(assert (=> b!278102 (=> (not res!141823) (not e!177374))))

(assert (=> b!278102 (= res!141823 (validKeyInArray!0 (select (arr!6571 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278101 () Bool)

(assert (=> b!278101 (= e!177376 call!25349)))

(declare-fun d!64779 () Bool)

(declare-fun res!141822 () Bool)

(assert (=> d!64779 (=> res!141822 e!177375)))

(assert (=> d!64779 (= res!141822 (bvsge #b00000000000000000000000000000000 (size!6923 a!3325)))))

(assert (=> d!64779 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4289) e!177375)))

(assert (= (and d!64779 (not res!141822)) b!278102))

(assert (= (and b!278102 res!141823) b!278098))

(assert (= (and b!278102 res!141824) b!278099))

(assert (= (and b!278099 c!45689) b!278101))

(assert (= (and b!278099 (not c!45689)) b!278100))

(assert (= (or b!278101 b!278100) bm!25346))

(assert (=> b!278098 m!293101))

(assert (=> b!278098 m!293101))

(declare-fun m!293167 () Bool)

(assert (=> b!278098 m!293167))

(assert (=> b!278099 m!293101))

(assert (=> b!278099 m!293101))

(assert (=> b!278099 m!293109))

(assert (=> bm!25346 m!293101))

(declare-fun m!293169 () Bool)

(assert (=> bm!25346 m!293169))

(assert (=> b!278102 m!293101))

(assert (=> b!278102 m!293101))

(assert (=> b!278102 m!293109))

(assert (=> b!277951 d!64779))

(declare-fun d!64785 () Bool)

(declare-fun lt!138245 () SeekEntryResult!1694)

(assert (=> d!64785 (and (or ((_ is Undefined!1694) lt!138245) (not ((_ is Found!1694) lt!138245)) (and (bvsge (index!8947 lt!138245) #b00000000000000000000000000000000) (bvslt (index!8947 lt!138245) (size!6923 a!3325)))) (or ((_ is Undefined!1694) lt!138245) ((_ is Found!1694) lt!138245) (not ((_ is MissingZero!1694) lt!138245)) (and (bvsge (index!8946 lt!138245) #b00000000000000000000000000000000) (bvslt (index!8946 lt!138245) (size!6923 a!3325)))) (or ((_ is Undefined!1694) lt!138245) ((_ is Found!1694) lt!138245) ((_ is MissingZero!1694) lt!138245) (not ((_ is MissingVacant!1694) lt!138245)) (and (bvsge (index!8949 lt!138245) #b00000000000000000000000000000000) (bvslt (index!8949 lt!138245) (size!6923 a!3325)))) (or ((_ is Undefined!1694) lt!138245) (ite ((_ is Found!1694) lt!138245) (= (select (arr!6571 a!3325) (index!8947 lt!138245)) k0!2581) (ite ((_ is MissingZero!1694) lt!138245) (= (select (arr!6571 a!3325) (index!8946 lt!138245)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1694) lt!138245) (= (select (arr!6571 a!3325) (index!8949 lt!138245)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!177380 () SeekEntryResult!1694)

(assert (=> d!64785 (= lt!138245 e!177380)))

(declare-fun c!45692 () Bool)

(declare-fun lt!138244 () SeekEntryResult!1694)

(assert (=> d!64785 (= c!45692 (and ((_ is Intermediate!1694) lt!138244) (undefined!2506 lt!138244)))))

(assert (=> d!64785 (= lt!138244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!64785 (validMask!0 mask!3868)))

(assert (=> d!64785 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138245)))

(declare-fun b!278103 () Bool)

(declare-fun e!177379 () SeekEntryResult!1694)

(assert (=> b!278103 (= e!177379 (MissingZero!1694 (index!8948 lt!138244)))))

(declare-fun b!278104 () Bool)

(declare-fun e!177378 () SeekEntryResult!1694)

(assert (=> b!278104 (= e!177380 e!177378)))

(declare-fun lt!138246 () (_ BitVec 64))

(assert (=> b!278104 (= lt!138246 (select (arr!6571 a!3325) (index!8948 lt!138244)))))

(declare-fun c!45690 () Bool)

(assert (=> b!278104 (= c!45690 (= lt!138246 k0!2581))))

(declare-fun b!278105 () Bool)

(declare-fun c!45691 () Bool)

(assert (=> b!278105 (= c!45691 (= lt!138246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278105 (= e!177378 e!177379)))

(declare-fun b!278106 () Bool)

(assert (=> b!278106 (= e!177380 Undefined!1694)))

(declare-fun b!278107 () Bool)

(assert (=> b!278107 (= e!177378 (Found!1694 (index!8948 lt!138244)))))

(declare-fun b!278108 () Bool)

(assert (=> b!278108 (= e!177379 (seekKeyOrZeroReturnVacant!0 (x!27299 lt!138244) (index!8948 lt!138244) (index!8948 lt!138244) k0!2581 a!3325 mask!3868))))

(assert (= (and d!64785 c!45692) b!278106))

(assert (= (and d!64785 (not c!45692)) b!278104))

(assert (= (and b!278104 c!45690) b!278107))

(assert (= (and b!278104 (not c!45690)) b!278105))

(assert (= (and b!278105 c!45691) b!278103))

(assert (= (and b!278105 (not c!45691)) b!278108))

(assert (=> d!64785 m!293043))

(assert (=> d!64785 m!293133))

(declare-fun m!293171 () Bool)

(assert (=> d!64785 m!293171))

(assert (=> d!64785 m!293133))

(declare-fun m!293173 () Bool)

(assert (=> d!64785 m!293173))

(declare-fun m!293175 () Bool)

(assert (=> d!64785 m!293175))

(declare-fun m!293177 () Bool)

(assert (=> d!64785 m!293177))

(declare-fun m!293179 () Bool)

(assert (=> b!278104 m!293179))

(declare-fun m!293181 () Bool)

(assert (=> b!278108 m!293181))

(assert (=> b!277945 d!64785))

(declare-fun d!64787 () Bool)

(declare-fun e!177383 () Bool)

(assert (=> d!64787 e!177383))

(declare-fun res!141827 () Bool)

(assert (=> d!64787 (=> (not res!141827) (not e!177383))))

(assert (=> d!64787 (= res!141827 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6923 a!3325))))))

(declare-fun lt!138249 () Unit!8771)

(declare-fun choose!98 (array!13844 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8771)

(assert (=> d!64787 (= lt!138249 (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!64787 (validMask!0 mask!3868)))

(assert (=> d!64787 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!138249)))

(declare-fun b!278111 () Bool)

(assert (=> b!278111 (= e!177383 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) mask!3868))))

(assert (= (and d!64787 res!141827) b!278111))

(declare-fun m!293183 () Bool)

(assert (=> d!64787 m!293183))

(assert (=> d!64787 m!293043))

(assert (=> b!278111 m!293023))

(declare-fun m!293185 () Bool)

(assert (=> b!278111 m!293185))

(assert (=> b!277954 d!64787))

(declare-fun bm!25347 () Bool)

(declare-fun call!25350 () Bool)

(assert (=> bm!25347 (= call!25350 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!138176 mask!3868))))

(declare-fun b!278112 () Bool)

(declare-fun e!177384 () Bool)

(declare-fun e!177386 () Bool)

(assert (=> b!278112 (= e!177384 e!177386)))

(declare-fun lt!138250 () (_ BitVec 64))

(assert (=> b!278112 (= lt!138250 (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!138252 () Unit!8771)

(assert (=> b!278112 (= lt!138252 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138176 lt!138250 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!278112 (arrayContainsKey!0 lt!138176 lt!138250 #b00000000000000000000000000000000)))

(declare-fun lt!138251 () Unit!8771)

(assert (=> b!278112 (= lt!138251 lt!138252)))

(declare-fun res!141828 () Bool)

(assert (=> b!278112 (= res!141828 (= (seekEntryOrOpen!0 (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138176 mask!3868) (Found!1694 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!278112 (=> (not res!141828) (not e!177386))))

(declare-fun b!278113 () Bool)

(assert (=> b!278113 (= e!177386 call!25350)))

(declare-fun b!278114 () Bool)

(assert (=> b!278114 (= e!177384 call!25350)))

(declare-fun b!278115 () Bool)

(declare-fun e!177385 () Bool)

(assert (=> b!278115 (= e!177385 e!177384)))

(declare-fun c!45693 () Bool)

(assert (=> b!278115 (= c!45693 (validKeyInArray!0 (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun d!64791 () Bool)

(declare-fun res!141829 () Bool)

(assert (=> d!64791 (=> res!141829 e!177385)))

(assert (=> d!64791 (= res!141829 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!6923 lt!138176)))))

(assert (=> d!64791 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138176 mask!3868) e!177385)))

(assert (= (and d!64791 (not res!141829)) b!278115))

(assert (= (and b!278115 c!45693) b!278112))

(assert (= (and b!278115 (not c!45693)) b!278114))

(assert (= (and b!278112 res!141828) b!278113))

(assert (= (or b!278113 b!278114) bm!25347))

(declare-fun m!293187 () Bool)

(assert (=> bm!25347 m!293187))

(declare-fun m!293189 () Bool)

(assert (=> b!278112 m!293189))

(declare-fun m!293191 () Bool)

(assert (=> b!278112 m!293191))

(declare-fun m!293193 () Bool)

(assert (=> b!278112 m!293193))

(assert (=> b!278112 m!293189))

(declare-fun m!293195 () Bool)

(assert (=> b!278112 m!293195))

(assert (=> b!278115 m!293189))

(assert (=> b!278115 m!293189))

(declare-fun m!293197 () Bool)

(assert (=> b!278115 m!293197))

(assert (=> b!277954 d!64791))

(declare-fun d!64795 () Bool)

(declare-fun res!141834 () Bool)

(declare-fun e!177391 () Bool)

(assert (=> d!64795 (=> res!141834 e!177391)))

(assert (=> d!64795 (= res!141834 (= (select (arr!6571 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!64795 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!177391)))

(declare-fun b!278120 () Bool)

(declare-fun e!177392 () Bool)

(assert (=> b!278120 (= e!177391 e!177392)))

(declare-fun res!141835 () Bool)

(assert (=> b!278120 (=> (not res!141835) (not e!177392))))

(assert (=> b!278120 (= res!141835 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6923 a!3325)))))

(declare-fun b!278121 () Bool)

(assert (=> b!278121 (= e!177392 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64795 (not res!141834)) b!278120))

(assert (= (and b!278120 res!141835) b!278121))

(assert (=> d!64795 m!293101))

(declare-fun m!293199 () Bool)

(assert (=> b!278121 m!293199))

(assert (=> b!277953 d!64795))

(declare-fun d!64797 () Bool)

(assert (=> d!64797 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!277947 d!64797))

(declare-fun d!64799 () Bool)

(assert (=> d!64799 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26748 d!64799))

(declare-fun d!64803 () Bool)

(assert (=> d!64803 (= (array_inv!4521 a!3325) (bvsge (size!6923 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26748 d!64803))

(check-sat (not b!278098) (not d!64773) (not bm!25337) (not b!278102) (not b!278115) (not bm!25346) (not d!64787) (not d!64765) (not b!278112) (not b!278075) (not b!278030) (not b!278026) (not b!278108) (not b!278027) (not b!278023) (not b!278099) (not bm!25347) (not b!278121) (not d!64785) (not bm!25336) (not b!278111) (not b!278071))
(check-sat)
(get-model)

(declare-fun d!64833 () Bool)

(assert (=> d!64833 (= (validKeyInArray!0 (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26))) (and (not (= (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278115 d!64833))

(declare-fun e!177471 () SeekEntryResult!1694)

(declare-fun b!278240 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!278240 (= e!177471 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27299 lt!138228) #b00000000000000000000000000000001) (nextIndex!0 (index!8948 lt!138228) (bvadd (x!27299 lt!138228) #b00000000000000000000000000000001) mask!3868) (index!8948 lt!138228) k0!2581 lt!138176 mask!3868))))

(declare-fun lt!138311 () SeekEntryResult!1694)

(declare-fun d!64835 () Bool)

(assert (=> d!64835 (and (or ((_ is Undefined!1694) lt!138311) (not ((_ is Found!1694) lt!138311)) (and (bvsge (index!8947 lt!138311) #b00000000000000000000000000000000) (bvslt (index!8947 lt!138311) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138311) ((_ is Found!1694) lt!138311) (not ((_ is MissingVacant!1694) lt!138311)) (not (= (index!8949 lt!138311) (index!8948 lt!138228))) (and (bvsge (index!8949 lt!138311) #b00000000000000000000000000000000) (bvslt (index!8949 lt!138311) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138311) (ite ((_ is Found!1694) lt!138311) (= (select (arr!6571 lt!138176) (index!8947 lt!138311)) k0!2581) (and ((_ is MissingVacant!1694) lt!138311) (= (index!8949 lt!138311) (index!8948 lt!138228)) (= (select (arr!6571 lt!138176) (index!8949 lt!138311)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!177472 () SeekEntryResult!1694)

(assert (=> d!64835 (= lt!138311 e!177472)))

(declare-fun c!45736 () Bool)

(assert (=> d!64835 (= c!45736 (bvsge (x!27299 lt!138228) #b01111111111111111111111111111110))))

(declare-fun lt!138312 () (_ BitVec 64))

(assert (=> d!64835 (= lt!138312 (select (arr!6571 lt!138176) (index!8948 lt!138228)))))

(assert (=> d!64835 (validMask!0 mask!3868)))

(assert (=> d!64835 (= (seekKeyOrZeroReturnVacant!0 (x!27299 lt!138228) (index!8948 lt!138228) (index!8948 lt!138228) k0!2581 lt!138176 mask!3868) lt!138311)))

(declare-fun b!278241 () Bool)

(assert (=> b!278241 (= e!177471 (MissingVacant!1694 (index!8948 lt!138228)))))

(declare-fun b!278242 () Bool)

(declare-fun c!45734 () Bool)

(assert (=> b!278242 (= c!45734 (= lt!138312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177473 () SeekEntryResult!1694)

(assert (=> b!278242 (= e!177473 e!177471)))

(declare-fun b!278243 () Bool)

(assert (=> b!278243 (= e!177472 Undefined!1694)))

(declare-fun b!278244 () Bool)

(assert (=> b!278244 (= e!177472 e!177473)))

(declare-fun c!45735 () Bool)

(assert (=> b!278244 (= c!45735 (= lt!138312 k0!2581))))

(declare-fun b!278245 () Bool)

(assert (=> b!278245 (= e!177473 (Found!1694 (index!8948 lt!138228)))))

(assert (= (and d!64835 c!45736) b!278243))

(assert (= (and d!64835 (not c!45736)) b!278244))

(assert (= (and b!278244 c!45735) b!278245))

(assert (= (and b!278244 (not c!45735)) b!278242))

(assert (= (and b!278242 c!45734) b!278241))

(assert (= (and b!278242 (not c!45734)) b!278240))

(declare-fun m!293327 () Bool)

(assert (=> b!278240 m!293327))

(assert (=> b!278240 m!293327))

(declare-fun m!293329 () Bool)

(assert (=> b!278240 m!293329))

(declare-fun m!293331 () Bool)

(assert (=> d!64835 m!293331))

(declare-fun m!293333 () Bool)

(assert (=> d!64835 m!293333))

(assert (=> d!64835 m!293143))

(assert (=> d!64835 m!293043))

(assert (=> b!278071 d!64835))

(declare-fun d!64837 () Bool)

(declare-fun res!141874 () Bool)

(declare-fun e!177474 () Bool)

(assert (=> d!64837 (=> res!141874 e!177474)))

(assert (=> d!64837 (= res!141874 (= (select (arr!6571 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2581))))

(assert (=> d!64837 (= (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!177474)))

(declare-fun b!278246 () Bool)

(declare-fun e!177475 () Bool)

(assert (=> b!278246 (= e!177474 e!177475)))

(declare-fun res!141875 () Bool)

(assert (=> b!278246 (=> (not res!141875) (not e!177475))))

(assert (=> b!278246 (= res!141875 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6923 a!3325)))))

(declare-fun b!278247 () Bool)

(assert (=> b!278247 (= e!177475 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!64837 (not res!141874)) b!278246))

(assert (= (and b!278246 res!141875) b!278247))

(declare-fun m!293335 () Bool)

(assert (=> d!64837 m!293335))

(declare-fun m!293337 () Bool)

(assert (=> b!278247 m!293337))

(assert (=> b!278121 d!64837))

(declare-fun b!278248 () Bool)

(declare-fun e!177476 () Bool)

(assert (=> b!278248 (= e!177476 (contains!1937 (ite c!45689 (Cons!4288 (select (arr!6571 a!3325) #b00000000000000000000000000000000) Nil!4289) Nil!4289) (select (arr!6571 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!278249 () Bool)

(declare-fun e!177479 () Bool)

(declare-fun e!177478 () Bool)

(assert (=> b!278249 (= e!177479 e!177478)))

(declare-fun c!45737 () Bool)

(assert (=> b!278249 (= c!45737 (validKeyInArray!0 (select (arr!6571 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25358 () Bool)

(declare-fun call!25361 () Bool)

(assert (=> bm!25358 (= call!25361 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45737 (Cons!4288 (select (arr!6571 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!45689 (Cons!4288 (select (arr!6571 a!3325) #b00000000000000000000000000000000) Nil!4289) Nil!4289)) (ite c!45689 (Cons!4288 (select (arr!6571 a!3325) #b00000000000000000000000000000000) Nil!4289) Nil!4289))))))

(declare-fun b!278250 () Bool)

(assert (=> b!278250 (= e!177478 call!25361)))

(declare-fun b!278252 () Bool)

(declare-fun e!177477 () Bool)

(assert (=> b!278252 (= e!177477 e!177479)))

(declare-fun res!141878 () Bool)

(assert (=> b!278252 (=> (not res!141878) (not e!177479))))

(assert (=> b!278252 (= res!141878 (not e!177476))))

(declare-fun res!141877 () Bool)

(assert (=> b!278252 (=> (not res!141877) (not e!177476))))

(assert (=> b!278252 (= res!141877 (validKeyInArray!0 (select (arr!6571 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!278251 () Bool)

(assert (=> b!278251 (= e!177478 call!25361)))

(declare-fun d!64839 () Bool)

(declare-fun res!141876 () Bool)

(assert (=> d!64839 (=> res!141876 e!177477)))

(assert (=> d!64839 (= res!141876 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6923 a!3325)))))

(assert (=> d!64839 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45689 (Cons!4288 (select (arr!6571 a!3325) #b00000000000000000000000000000000) Nil!4289) Nil!4289)) e!177477)))

(assert (= (and d!64839 (not res!141876)) b!278252))

(assert (= (and b!278252 res!141877) b!278248))

(assert (= (and b!278252 res!141878) b!278249))

(assert (= (and b!278249 c!45737) b!278251))

(assert (= (and b!278249 (not c!45737)) b!278250))

(assert (= (or b!278251 b!278250) bm!25358))

(assert (=> b!278248 m!293335))

(assert (=> b!278248 m!293335))

(declare-fun m!293339 () Bool)

(assert (=> b!278248 m!293339))

(assert (=> b!278249 m!293335))

(assert (=> b!278249 m!293335))

(declare-fun m!293341 () Bool)

(assert (=> b!278249 m!293341))

(assert (=> bm!25358 m!293335))

(declare-fun m!293343 () Bool)

(assert (=> bm!25358 m!293343))

(assert (=> b!278252 m!293335))

(assert (=> b!278252 m!293335))

(assert (=> b!278252 m!293341))

(assert (=> bm!25346 d!64839))

(declare-fun d!64841 () Bool)

(assert (=> d!64841 (arrayContainsKey!0 a!3325 lt!138214 #b00000000000000000000000000000000)))

(declare-fun lt!138315 () Unit!8771)

(declare-fun choose!13 (array!13844 (_ BitVec 64) (_ BitVec 32)) Unit!8771)

(assert (=> d!64841 (= lt!138315 (choose!13 a!3325 lt!138214 #b00000000000000000000000000000000))))

(assert (=> d!64841 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!64841 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138214 #b00000000000000000000000000000000) lt!138315)))

(declare-fun bs!9931 () Bool)

(assert (= bs!9931 d!64841))

(assert (=> bs!9931 m!293105))

(declare-fun m!293345 () Bool)

(assert (=> bs!9931 m!293345))

(assert (=> b!278023 d!64841))

(declare-fun d!64843 () Bool)

(declare-fun res!141879 () Bool)

(declare-fun e!177480 () Bool)

(assert (=> d!64843 (=> res!141879 e!177480)))

(assert (=> d!64843 (= res!141879 (= (select (arr!6571 a!3325) #b00000000000000000000000000000000) lt!138214))))

(assert (=> d!64843 (= (arrayContainsKey!0 a!3325 lt!138214 #b00000000000000000000000000000000) e!177480)))

(declare-fun b!278253 () Bool)

(declare-fun e!177481 () Bool)

(assert (=> b!278253 (= e!177480 e!177481)))

(declare-fun res!141880 () Bool)

(assert (=> b!278253 (=> (not res!141880) (not e!177481))))

(assert (=> b!278253 (= res!141880 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6923 a!3325)))))

(declare-fun b!278254 () Bool)

(assert (=> b!278254 (= e!177481 (arrayContainsKey!0 a!3325 lt!138214 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64843 (not res!141879)) b!278253))

(assert (= (and b!278253 res!141880) b!278254))

(assert (=> d!64843 m!293101))

(declare-fun m!293347 () Bool)

(assert (=> b!278254 m!293347))

(assert (=> b!278023 d!64843))

(declare-fun d!64845 () Bool)

(declare-fun lt!138317 () SeekEntryResult!1694)

(assert (=> d!64845 (and (or ((_ is Undefined!1694) lt!138317) (not ((_ is Found!1694) lt!138317)) (and (bvsge (index!8947 lt!138317) #b00000000000000000000000000000000) (bvslt (index!8947 lt!138317) (size!6923 a!3325)))) (or ((_ is Undefined!1694) lt!138317) ((_ is Found!1694) lt!138317) (not ((_ is MissingZero!1694) lt!138317)) (and (bvsge (index!8946 lt!138317) #b00000000000000000000000000000000) (bvslt (index!8946 lt!138317) (size!6923 a!3325)))) (or ((_ is Undefined!1694) lt!138317) ((_ is Found!1694) lt!138317) ((_ is MissingZero!1694) lt!138317) (not ((_ is MissingVacant!1694) lt!138317)) (and (bvsge (index!8949 lt!138317) #b00000000000000000000000000000000) (bvslt (index!8949 lt!138317) (size!6923 a!3325)))) (or ((_ is Undefined!1694) lt!138317) (ite ((_ is Found!1694) lt!138317) (= (select (arr!6571 a!3325) (index!8947 lt!138317)) (select (arr!6571 a!3325) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1694) lt!138317) (= (select (arr!6571 a!3325) (index!8946 lt!138317)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1694) lt!138317) (= (select (arr!6571 a!3325) (index!8949 lt!138317)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!177484 () SeekEntryResult!1694)

(assert (=> d!64845 (= lt!138317 e!177484)))

(declare-fun c!45740 () Bool)

(declare-fun lt!138316 () SeekEntryResult!1694)

(assert (=> d!64845 (= c!45740 (and ((_ is Intermediate!1694) lt!138316) (undefined!2506 lt!138316)))))

(assert (=> d!64845 (= lt!138316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6571 a!3325) #b00000000000000000000000000000000) mask!3868) (select (arr!6571 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (=> d!64845 (validMask!0 mask!3868)))

(assert (=> d!64845 (= (seekEntryOrOpen!0 (select (arr!6571 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) lt!138317)))

(declare-fun b!278255 () Bool)

(declare-fun e!177483 () SeekEntryResult!1694)

(assert (=> b!278255 (= e!177483 (MissingZero!1694 (index!8948 lt!138316)))))

(declare-fun b!278256 () Bool)

(declare-fun e!177482 () SeekEntryResult!1694)

(assert (=> b!278256 (= e!177484 e!177482)))

(declare-fun lt!138318 () (_ BitVec 64))

(assert (=> b!278256 (= lt!138318 (select (arr!6571 a!3325) (index!8948 lt!138316)))))

(declare-fun c!45738 () Bool)

(assert (=> b!278256 (= c!45738 (= lt!138318 (select (arr!6571 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278257 () Bool)

(declare-fun c!45739 () Bool)

(assert (=> b!278257 (= c!45739 (= lt!138318 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278257 (= e!177482 e!177483)))

(declare-fun b!278258 () Bool)

(assert (=> b!278258 (= e!177484 Undefined!1694)))

(declare-fun b!278259 () Bool)

(assert (=> b!278259 (= e!177482 (Found!1694 (index!8948 lt!138316)))))

(declare-fun b!278260 () Bool)

(assert (=> b!278260 (= e!177483 (seekKeyOrZeroReturnVacant!0 (x!27299 lt!138316) (index!8948 lt!138316) (index!8948 lt!138316) (select (arr!6571 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (= (and d!64845 c!45740) b!278258))

(assert (= (and d!64845 (not c!45740)) b!278256))

(assert (= (and b!278256 c!45738) b!278259))

(assert (= (and b!278256 (not c!45738)) b!278257))

(assert (= (and b!278257 c!45739) b!278255))

(assert (= (and b!278257 (not c!45739)) b!278260))

(assert (=> d!64845 m!293043))

(assert (=> d!64845 m!293101))

(declare-fun m!293349 () Bool)

(assert (=> d!64845 m!293349))

(declare-fun m!293351 () Bool)

(assert (=> d!64845 m!293351))

(assert (=> d!64845 m!293349))

(assert (=> d!64845 m!293101))

(declare-fun m!293353 () Bool)

(assert (=> d!64845 m!293353))

(declare-fun m!293355 () Bool)

(assert (=> d!64845 m!293355))

(declare-fun m!293357 () Bool)

(assert (=> d!64845 m!293357))

(declare-fun m!293359 () Bool)

(assert (=> b!278256 m!293359))

(assert (=> b!278260 m!293101))

(declare-fun m!293361 () Bool)

(assert (=> b!278260 m!293361))

(assert (=> b!278023 d!64845))

(declare-fun d!64847 () Bool)

(assert (=> d!64847 (= (validKeyInArray!0 (select (arr!6571 lt!138176) startIndex!26)) (and (not (= (select (arr!6571 lt!138176) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6571 lt!138176) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278030 d!64847))

(declare-fun d!64849 () Bool)

(assert (=> d!64849 (= (validKeyInArray!0 (select (arr!6571 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6571 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6571 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278099 d!64849))

(assert (=> b!278102 d!64849))

(declare-fun b!278279 () Bool)

(declare-fun e!177497 () SeekEntryResult!1694)

(declare-fun e!177499 () SeekEntryResult!1694)

(assert (=> b!278279 (= e!177497 e!177499)))

(declare-fun c!45749 () Bool)

(declare-fun lt!138324 () (_ BitVec 64))

(assert (=> b!278279 (= c!45749 (or (= lt!138324 k0!2581) (= (bvadd lt!138324 lt!138324) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!278280 () Bool)

(declare-fun lt!138323 () SeekEntryResult!1694)

(assert (=> b!278280 (and (bvsge (index!8948 lt!138323) #b00000000000000000000000000000000) (bvslt (index!8948 lt!138323) (size!6923 lt!138176)))))

(declare-fun res!141889 () Bool)

(assert (=> b!278280 (= res!141889 (= (select (arr!6571 lt!138176) (index!8948 lt!138323)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177496 () Bool)

(assert (=> b!278280 (=> res!141889 e!177496)))

(declare-fun b!278281 () Bool)

(declare-fun e!177498 () Bool)

(assert (=> b!278281 (= e!177498 (bvsge (x!27299 lt!138323) #b01111111111111111111111111111110))))

(declare-fun b!278282 () Bool)

(assert (=> b!278282 (and (bvsge (index!8948 lt!138323) #b00000000000000000000000000000000) (bvslt (index!8948 lt!138323) (size!6923 lt!138176)))))

(declare-fun res!141888 () Bool)

(assert (=> b!278282 (= res!141888 (= (select (arr!6571 lt!138176) (index!8948 lt!138323)) k0!2581))))

(assert (=> b!278282 (=> res!141888 e!177496)))

(declare-fun e!177495 () Bool)

(assert (=> b!278282 (= e!177495 e!177496)))

(declare-fun b!278283 () Bool)

(assert (=> b!278283 (= e!177497 (Intermediate!1694 true (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278285 () Bool)

(assert (=> b!278285 (= e!177499 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2581 mask!3868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3868) k0!2581 lt!138176 mask!3868))))

(declare-fun b!278284 () Bool)

(assert (=> b!278284 (and (bvsge (index!8948 lt!138323) #b00000000000000000000000000000000) (bvslt (index!8948 lt!138323) (size!6923 lt!138176)))))

(assert (=> b!278284 (= e!177496 (= (select (arr!6571 lt!138176) (index!8948 lt!138323)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!64851 () Bool)

(assert (=> d!64851 e!177498))

(declare-fun c!45747 () Bool)

(assert (=> d!64851 (= c!45747 (and ((_ is Intermediate!1694) lt!138323) (undefined!2506 lt!138323)))))

(assert (=> d!64851 (= lt!138323 e!177497)))

(declare-fun c!45748 () Bool)

(assert (=> d!64851 (= c!45748 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!64851 (= lt!138324 (select (arr!6571 lt!138176) (toIndex!0 k0!2581 mask!3868)))))

(assert (=> d!64851 (validMask!0 mask!3868)))

(assert (=> d!64851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 lt!138176 mask!3868) lt!138323)))

(declare-fun b!278286 () Bool)

(assert (=> b!278286 (= e!177498 e!177495)))

(declare-fun res!141887 () Bool)

(assert (=> b!278286 (= res!141887 (and ((_ is Intermediate!1694) lt!138323) (not (undefined!2506 lt!138323)) (bvslt (x!27299 lt!138323) #b01111111111111111111111111111110) (bvsge (x!27299 lt!138323) #b00000000000000000000000000000000) (bvsge (x!27299 lt!138323) #b00000000000000000000000000000000)))))

(assert (=> b!278286 (=> (not res!141887) (not e!177495))))

(declare-fun b!278287 () Bool)

(assert (=> b!278287 (= e!177499 (Intermediate!1694 false (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(assert (= (and d!64851 c!45748) b!278283))

(assert (= (and d!64851 (not c!45748)) b!278279))

(assert (= (and b!278279 c!45749) b!278287))

(assert (= (and b!278279 (not c!45749)) b!278285))

(assert (= (and d!64851 c!45747) b!278281))

(assert (= (and d!64851 (not c!45747)) b!278286))

(assert (= (and b!278286 res!141887) b!278282))

(assert (= (and b!278282 (not res!141888)) b!278280))

(assert (= (and b!278280 (not res!141889)) b!278284))

(declare-fun m!293363 () Bool)

(assert (=> b!278284 m!293363))

(assert (=> b!278282 m!293363))

(assert (=> d!64851 m!293133))

(declare-fun m!293365 () Bool)

(assert (=> d!64851 m!293365))

(assert (=> d!64851 m!293043))

(assert (=> b!278280 m!293363))

(assert (=> b!278285 m!293133))

(declare-fun m!293367 () Bool)

(assert (=> b!278285 m!293367))

(assert (=> b!278285 m!293367))

(declare-fun m!293369 () Bool)

(assert (=> b!278285 m!293369))

(assert (=> d!64765 d!64851))

(declare-fun d!64853 () Bool)

(declare-fun lt!138330 () (_ BitVec 32))

(declare-fun lt!138329 () (_ BitVec 32))

(assert (=> d!64853 (= lt!138330 (bvmul (bvxor lt!138329 (bvlshr lt!138329 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!64853 (= lt!138329 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!64853 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!141890 (let ((h!4958 ((_ extract 31 0) (bvand (bvxor k0!2581 (bvlshr k0!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27304 (bvmul (bvxor h!4958 (bvlshr h!4958 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27304 (bvlshr x!27304 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!141890 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!141890 #b00000000000000000000000000000000))))))

(assert (=> d!64853 (= (toIndex!0 k0!2581 mask!3868) (bvand (bvxor lt!138330 (bvlshr lt!138330 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!64765 d!64853))

(assert (=> d!64765 d!64799))

(assert (=> b!278026 d!64849))

(declare-fun b!278288 () Bool)

(declare-fun e!177500 () SeekEntryResult!1694)

(assert (=> b!278288 (= e!177500 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27299 lt!138244) #b00000000000000000000000000000001) (nextIndex!0 (index!8948 lt!138244) (bvadd (x!27299 lt!138244) #b00000000000000000000000000000001) mask!3868) (index!8948 lt!138244) k0!2581 a!3325 mask!3868))))

(declare-fun lt!138331 () SeekEntryResult!1694)

(declare-fun d!64855 () Bool)

(assert (=> d!64855 (and (or ((_ is Undefined!1694) lt!138331) (not ((_ is Found!1694) lt!138331)) (and (bvsge (index!8947 lt!138331) #b00000000000000000000000000000000) (bvslt (index!8947 lt!138331) (size!6923 a!3325)))) (or ((_ is Undefined!1694) lt!138331) ((_ is Found!1694) lt!138331) (not ((_ is MissingVacant!1694) lt!138331)) (not (= (index!8949 lt!138331) (index!8948 lt!138244))) (and (bvsge (index!8949 lt!138331) #b00000000000000000000000000000000) (bvslt (index!8949 lt!138331) (size!6923 a!3325)))) (or ((_ is Undefined!1694) lt!138331) (ite ((_ is Found!1694) lt!138331) (= (select (arr!6571 a!3325) (index!8947 lt!138331)) k0!2581) (and ((_ is MissingVacant!1694) lt!138331) (= (index!8949 lt!138331) (index!8948 lt!138244)) (= (select (arr!6571 a!3325) (index!8949 lt!138331)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!177501 () SeekEntryResult!1694)

(assert (=> d!64855 (= lt!138331 e!177501)))

(declare-fun c!45752 () Bool)

(assert (=> d!64855 (= c!45752 (bvsge (x!27299 lt!138244) #b01111111111111111111111111111110))))

(declare-fun lt!138332 () (_ BitVec 64))

(assert (=> d!64855 (= lt!138332 (select (arr!6571 a!3325) (index!8948 lt!138244)))))

(assert (=> d!64855 (validMask!0 mask!3868)))

(assert (=> d!64855 (= (seekKeyOrZeroReturnVacant!0 (x!27299 lt!138244) (index!8948 lt!138244) (index!8948 lt!138244) k0!2581 a!3325 mask!3868) lt!138331)))

(declare-fun b!278289 () Bool)

(assert (=> b!278289 (= e!177500 (MissingVacant!1694 (index!8948 lt!138244)))))

(declare-fun b!278290 () Bool)

(declare-fun c!45750 () Bool)

(assert (=> b!278290 (= c!45750 (= lt!138332 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177502 () SeekEntryResult!1694)

(assert (=> b!278290 (= e!177502 e!177500)))

(declare-fun b!278291 () Bool)

(assert (=> b!278291 (= e!177501 Undefined!1694)))

(declare-fun b!278292 () Bool)

(assert (=> b!278292 (= e!177501 e!177502)))

(declare-fun c!45751 () Bool)

(assert (=> b!278292 (= c!45751 (= lt!138332 k0!2581))))

(declare-fun b!278293 () Bool)

(assert (=> b!278293 (= e!177502 (Found!1694 (index!8948 lt!138244)))))

(assert (= (and d!64855 c!45752) b!278291))

(assert (= (and d!64855 (not c!45752)) b!278292))

(assert (= (and b!278292 c!45751) b!278293))

(assert (= (and b!278292 (not c!45751)) b!278290))

(assert (= (and b!278290 c!45750) b!278289))

(assert (= (and b!278290 (not c!45750)) b!278288))

(declare-fun m!293371 () Bool)

(assert (=> b!278288 m!293371))

(assert (=> b!278288 m!293371))

(declare-fun m!293373 () Bool)

(assert (=> b!278288 m!293373))

(declare-fun m!293375 () Bool)

(assert (=> d!64855 m!293375))

(declare-fun m!293377 () Bool)

(assert (=> d!64855 m!293377))

(assert (=> d!64855 m!293179))

(assert (=> d!64855 m!293043))

(assert (=> b!278108 d!64855))

(declare-fun call!25362 () Bool)

(declare-fun bm!25359 () Bool)

(assert (=> bm!25359 (= call!25362 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) mask!3868))))

(declare-fun b!278294 () Bool)

(declare-fun e!177503 () Bool)

(declare-fun e!177505 () Bool)

(assert (=> b!278294 (= e!177503 e!177505)))

(declare-fun lt!138333 () (_ BitVec 64))

(assert (=> b!278294 (= lt!138333 (select (arr!6571 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!138335 () Unit!8771)

(assert (=> b!278294 (= lt!138335 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) lt!138333 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!278294 (arrayContainsKey!0 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) lt!138333 #b00000000000000000000000000000000)))

(declare-fun lt!138334 () Unit!8771)

(assert (=> b!278294 (= lt!138334 lt!138335)))

(declare-fun res!141891 () Bool)

(assert (=> b!278294 (= res!141891 (= (seekEntryOrOpen!0 (select (arr!6571 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26)) (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) mask!3868) (Found!1694 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!278294 (=> (not res!141891) (not e!177505))))

(declare-fun b!278295 () Bool)

(assert (=> b!278295 (= e!177505 call!25362)))

(declare-fun b!278296 () Bool)

(assert (=> b!278296 (= e!177503 call!25362)))

(declare-fun b!278297 () Bool)

(declare-fun e!177504 () Bool)

(assert (=> b!278297 (= e!177504 e!177503)))

(declare-fun c!45753 () Bool)

(assert (=> b!278297 (= c!45753 (validKeyInArray!0 (select (arr!6571 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325))) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun d!64857 () Bool)

(declare-fun res!141892 () Bool)

(assert (=> d!64857 (=> res!141892 e!177504)))

(assert (=> d!64857 (= res!141892 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!6923 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)))))))

(assert (=> d!64857 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) mask!3868) e!177504)))

(assert (= (and d!64857 (not res!141892)) b!278297))

(assert (= (and b!278297 c!45753) b!278294))

(assert (= (and b!278297 (not c!45753)) b!278296))

(assert (= (and b!278294 res!141891) b!278295))

(assert (= (or b!278295 b!278296) bm!25359))

(declare-fun m!293379 () Bool)

(assert (=> bm!25359 m!293379))

(declare-fun m!293381 () Bool)

(assert (=> b!278294 m!293381))

(declare-fun m!293383 () Bool)

(assert (=> b!278294 m!293383))

(declare-fun m!293385 () Bool)

(assert (=> b!278294 m!293385))

(assert (=> b!278294 m!293381))

(declare-fun m!293387 () Bool)

(assert (=> b!278294 m!293387))

(assert (=> b!278297 m!293381))

(assert (=> b!278297 m!293381))

(declare-fun m!293389 () Bool)

(assert (=> b!278297 m!293389))

(assert (=> b!278111 d!64857))

(declare-fun bm!25360 () Bool)

(declare-fun call!25363 () Bool)

(assert (=> bm!25360 (= call!25363 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!138176 mask!3868))))

(declare-fun b!278298 () Bool)

(declare-fun e!177506 () Bool)

(declare-fun e!177508 () Bool)

(assert (=> b!278298 (= e!177506 e!177508)))

(declare-fun lt!138336 () (_ BitVec 64))

(assert (=> b!278298 (= lt!138336 (select (arr!6571 lt!138176) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!138338 () Unit!8771)

(assert (=> b!278298 (= lt!138338 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138176 lt!138336 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!278298 (arrayContainsKey!0 lt!138176 lt!138336 #b00000000000000000000000000000000)))

(declare-fun lt!138337 () Unit!8771)

(assert (=> b!278298 (= lt!138337 lt!138338)))

(declare-fun res!141893 () Bool)

(assert (=> b!278298 (= res!141893 (= (seekEntryOrOpen!0 (select (arr!6571 lt!138176) (bvadd startIndex!26 #b00000000000000000000000000000001)) lt!138176 mask!3868) (Found!1694 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!278298 (=> (not res!141893) (not e!177508))))

(declare-fun b!278299 () Bool)

(assert (=> b!278299 (= e!177508 call!25363)))

(declare-fun b!278300 () Bool)

(assert (=> b!278300 (= e!177506 call!25363)))

(declare-fun b!278301 () Bool)

(declare-fun e!177507 () Bool)

(assert (=> b!278301 (= e!177507 e!177506)))

(declare-fun c!45754 () Bool)

(assert (=> b!278301 (= c!45754 (validKeyInArray!0 (select (arr!6571 lt!138176) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun d!64859 () Bool)

(declare-fun res!141894 () Bool)

(assert (=> d!64859 (=> res!141894 e!177507)))

(assert (=> d!64859 (= res!141894 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!6923 lt!138176)))))

(assert (=> d!64859 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!138176 mask!3868) e!177507)))

(assert (= (and d!64859 (not res!141894)) b!278301))

(assert (= (and b!278301 c!45754) b!278298))

(assert (= (and b!278301 (not c!45754)) b!278300))

(assert (= (and b!278298 res!141893) b!278299))

(assert (= (or b!278299 b!278300) bm!25360))

(declare-fun m!293391 () Bool)

(assert (=> bm!25360 m!293391))

(declare-fun m!293393 () Bool)

(assert (=> b!278298 m!293393))

(declare-fun m!293395 () Bool)

(assert (=> b!278298 m!293395))

(declare-fun m!293397 () Bool)

(assert (=> b!278298 m!293397))

(assert (=> b!278298 m!293393))

(declare-fun m!293399 () Bool)

(assert (=> b!278298 m!293399))

(assert (=> b!278301 m!293393))

(assert (=> b!278301 m!293393))

(declare-fun m!293401 () Bool)

(assert (=> b!278301 m!293401))

(assert (=> bm!25337 d!64859))

(declare-fun d!64861 () Bool)

(assert (=> d!64861 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) mask!3868)))

(assert (=> d!64861 true))

(declare-fun _$55!33 () Unit!8771)

(assert (=> d!64861 (= (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) _$55!33)))

(declare-fun bs!9932 () Bool)

(assert (= bs!9932 d!64861))

(assert (=> bs!9932 m!293023))

(assert (=> bs!9932 m!293185))

(assert (=> d!64787 d!64861))

(assert (=> d!64787 d!64799))

(declare-fun d!64863 () Bool)

(assert (=> d!64863 (= (seekEntryOrOpen!0 k0!2581 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) mask!3868) (Found!1694 i!1267))))

(assert (=> d!64863 true))

(declare-fun _$54!17 () Unit!8771)

(assert (=> d!64863 (= (choose!8 a!3325 i!1267 k0!2581 mask!3868) _$54!17)))

(declare-fun bs!9933 () Bool)

(assert (= bs!9933 d!64863))

(assert (=> bs!9933 m!293023))

(assert (=> bs!9933 m!293153))

(assert (=> d!64773 d!64863))

(assert (=> d!64773 d!64799))

(declare-fun lt!138340 () SeekEntryResult!1694)

(declare-fun d!64865 () Bool)

(assert (=> d!64865 (and (or ((_ is Undefined!1694) lt!138340) (not ((_ is Found!1694) lt!138340)) (and (bvsge (index!8947 lt!138340) #b00000000000000000000000000000000) (bvslt (index!8947 lt!138340) (size!6923 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)))))) (or ((_ is Undefined!1694) lt!138340) ((_ is Found!1694) lt!138340) (not ((_ is MissingZero!1694) lt!138340)) (and (bvsge (index!8946 lt!138340) #b00000000000000000000000000000000) (bvslt (index!8946 lt!138340) (size!6923 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)))))) (or ((_ is Undefined!1694) lt!138340) ((_ is Found!1694) lt!138340) ((_ is MissingZero!1694) lt!138340) (not ((_ is MissingVacant!1694) lt!138340)) (and (bvsge (index!8949 lt!138340) #b00000000000000000000000000000000) (bvslt (index!8949 lt!138340) (size!6923 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)))))) (or ((_ is Undefined!1694) lt!138340) (ite ((_ is Found!1694) lt!138340) (= (select (arr!6571 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325))) (index!8947 lt!138340)) k0!2581) (ite ((_ is MissingZero!1694) lt!138340) (= (select (arr!6571 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325))) (index!8946 lt!138340)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1694) lt!138340) (= (select (arr!6571 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325))) (index!8949 lt!138340)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!177511 () SeekEntryResult!1694)

(assert (=> d!64865 (= lt!138340 e!177511)))

(declare-fun c!45757 () Bool)

(declare-fun lt!138339 () SeekEntryResult!1694)

(assert (=> d!64865 (= c!45757 (and ((_ is Intermediate!1694) lt!138339) (undefined!2506 lt!138339)))))

(assert (=> d!64865 (= lt!138339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) mask!3868))))

(assert (=> d!64865 (validMask!0 mask!3868)))

(assert (=> d!64865 (= (seekEntryOrOpen!0 k0!2581 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) mask!3868) lt!138340)))

(declare-fun b!278302 () Bool)

(declare-fun e!177510 () SeekEntryResult!1694)

(assert (=> b!278302 (= e!177510 (MissingZero!1694 (index!8948 lt!138339)))))

(declare-fun b!278303 () Bool)

(declare-fun e!177509 () SeekEntryResult!1694)

(assert (=> b!278303 (= e!177511 e!177509)))

(declare-fun lt!138341 () (_ BitVec 64))

(assert (=> b!278303 (= lt!138341 (select (arr!6571 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325))) (index!8948 lt!138339)))))

(declare-fun c!45755 () Bool)

(assert (=> b!278303 (= c!45755 (= lt!138341 k0!2581))))

(declare-fun b!278304 () Bool)

(declare-fun c!45756 () Bool)

(assert (=> b!278304 (= c!45756 (= lt!138341 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278304 (= e!177509 e!177510)))

(declare-fun b!278305 () Bool)

(assert (=> b!278305 (= e!177511 Undefined!1694)))

(declare-fun b!278306 () Bool)

(assert (=> b!278306 (= e!177509 (Found!1694 (index!8948 lt!138339)))))

(declare-fun b!278307 () Bool)

(assert (=> b!278307 (= e!177510 (seekKeyOrZeroReturnVacant!0 (x!27299 lt!138339) (index!8948 lt!138339) (index!8948 lt!138339) k0!2581 (array!13845 (store (arr!6571 a!3325) i!1267 k0!2581) (size!6923 a!3325)) mask!3868))))

(assert (= (and d!64865 c!45757) b!278305))

(assert (= (and d!64865 (not c!45757)) b!278303))

(assert (= (and b!278303 c!45755) b!278306))

(assert (= (and b!278303 (not c!45755)) b!278304))

(assert (= (and b!278304 c!45756) b!278302))

(assert (= (and b!278304 (not c!45756)) b!278307))

(assert (=> d!64865 m!293043))

(assert (=> d!64865 m!293133))

(declare-fun m!293403 () Bool)

(assert (=> d!64865 m!293403))

(assert (=> d!64865 m!293133))

(declare-fun m!293405 () Bool)

(assert (=> d!64865 m!293405))

(declare-fun m!293407 () Bool)

(assert (=> d!64865 m!293407))

(declare-fun m!293409 () Bool)

(assert (=> d!64865 m!293409))

(declare-fun m!293411 () Bool)

(assert (=> b!278303 m!293411))

(declare-fun m!293413 () Bool)

(assert (=> b!278307 m!293413))

(assert (=> b!278075 d!64865))

(declare-fun b!278308 () Bool)

(declare-fun e!177514 () SeekEntryResult!1694)

(declare-fun e!177516 () SeekEntryResult!1694)

(assert (=> b!278308 (= e!177514 e!177516)))

(declare-fun c!45760 () Bool)

(declare-fun lt!138343 () (_ BitVec 64))

(assert (=> b!278308 (= c!45760 (or (= lt!138343 k0!2581) (= (bvadd lt!138343 lt!138343) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!278309 () Bool)

(declare-fun lt!138342 () SeekEntryResult!1694)

(assert (=> b!278309 (and (bvsge (index!8948 lt!138342) #b00000000000000000000000000000000) (bvslt (index!8948 lt!138342) (size!6923 a!3325)))))

(declare-fun res!141897 () Bool)

(assert (=> b!278309 (= res!141897 (= (select (arr!6571 a!3325) (index!8948 lt!138342)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177513 () Bool)

(assert (=> b!278309 (=> res!141897 e!177513)))

(declare-fun b!278310 () Bool)

(declare-fun e!177515 () Bool)

(assert (=> b!278310 (= e!177515 (bvsge (x!27299 lt!138342) #b01111111111111111111111111111110))))

(declare-fun b!278311 () Bool)

(assert (=> b!278311 (and (bvsge (index!8948 lt!138342) #b00000000000000000000000000000000) (bvslt (index!8948 lt!138342) (size!6923 a!3325)))))

(declare-fun res!141896 () Bool)

(assert (=> b!278311 (= res!141896 (= (select (arr!6571 a!3325) (index!8948 lt!138342)) k0!2581))))

(assert (=> b!278311 (=> res!141896 e!177513)))

(declare-fun e!177512 () Bool)

(assert (=> b!278311 (= e!177512 e!177513)))

(declare-fun b!278312 () Bool)

(assert (=> b!278312 (= e!177514 (Intermediate!1694 true (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278314 () Bool)

(assert (=> b!278314 (= e!177516 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2581 mask!3868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3868) k0!2581 a!3325 mask!3868))))

(declare-fun b!278313 () Bool)

(assert (=> b!278313 (and (bvsge (index!8948 lt!138342) #b00000000000000000000000000000000) (bvslt (index!8948 lt!138342) (size!6923 a!3325)))))

(assert (=> b!278313 (= e!177513 (= (select (arr!6571 a!3325) (index!8948 lt!138342)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!64867 () Bool)

(assert (=> d!64867 e!177515))

(declare-fun c!45758 () Bool)

(assert (=> d!64867 (= c!45758 (and ((_ is Intermediate!1694) lt!138342) (undefined!2506 lt!138342)))))

(assert (=> d!64867 (= lt!138342 e!177514)))

(declare-fun c!45759 () Bool)

(assert (=> d!64867 (= c!45759 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!64867 (= lt!138343 (select (arr!6571 a!3325) (toIndex!0 k0!2581 mask!3868)))))

(assert (=> d!64867 (validMask!0 mask!3868)))

(assert (=> d!64867 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868) lt!138342)))

(declare-fun b!278315 () Bool)

(assert (=> b!278315 (= e!177515 e!177512)))

(declare-fun res!141895 () Bool)

(assert (=> b!278315 (= res!141895 (and ((_ is Intermediate!1694) lt!138342) (not (undefined!2506 lt!138342)) (bvslt (x!27299 lt!138342) #b01111111111111111111111111111110) (bvsge (x!27299 lt!138342) #b00000000000000000000000000000000) (bvsge (x!27299 lt!138342) #b00000000000000000000000000000000)))))

(assert (=> b!278315 (=> (not res!141895) (not e!177512))))

(declare-fun b!278316 () Bool)

(assert (=> b!278316 (= e!177516 (Intermediate!1694 false (toIndex!0 k0!2581 mask!3868) #b00000000000000000000000000000000))))

(assert (= (and d!64867 c!45759) b!278312))

(assert (= (and d!64867 (not c!45759)) b!278308))

(assert (= (and b!278308 c!45760) b!278316))

(assert (= (and b!278308 (not c!45760)) b!278314))

(assert (= (and d!64867 c!45758) b!278310))

(assert (= (and d!64867 (not c!45758)) b!278315))

(assert (= (and b!278315 res!141895) b!278311))

(assert (= (and b!278311 (not res!141896)) b!278309))

(assert (= (and b!278309 (not res!141897)) b!278313))

(declare-fun m!293415 () Bool)

(assert (=> b!278313 m!293415))

(assert (=> b!278311 m!293415))

(assert (=> d!64867 m!293133))

(declare-fun m!293417 () Bool)

(assert (=> d!64867 m!293417))

(assert (=> d!64867 m!293043))

(assert (=> b!278309 m!293415))

(assert (=> b!278314 m!293133))

(assert (=> b!278314 m!293367))

(assert (=> b!278314 m!293367))

(declare-fun m!293419 () Bool)

(assert (=> b!278314 m!293419))

(assert (=> d!64785 d!64867))

(assert (=> d!64785 d!64853))

(assert (=> d!64785 d!64799))

(declare-fun bm!25361 () Bool)

(declare-fun call!25364 () Bool)

(assert (=> bm!25361 (= call!25364 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!278317 () Bool)

(declare-fun e!177517 () Bool)

(declare-fun e!177519 () Bool)

(assert (=> b!278317 (= e!177517 e!177519)))

(declare-fun lt!138344 () (_ BitVec 64))

(assert (=> b!278317 (= lt!138344 (select (arr!6571 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!138346 () Unit!8771)

(assert (=> b!278317 (= lt!138346 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138344 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!278317 (arrayContainsKey!0 a!3325 lt!138344 #b00000000000000000000000000000000)))

(declare-fun lt!138345 () Unit!8771)

(assert (=> b!278317 (= lt!138345 lt!138346)))

(declare-fun res!141898 () Bool)

(assert (=> b!278317 (= res!141898 (= (seekEntryOrOpen!0 (select (arr!6571 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1694 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!278317 (=> (not res!141898) (not e!177519))))

(declare-fun b!278318 () Bool)

(assert (=> b!278318 (= e!177519 call!25364)))

(declare-fun b!278319 () Bool)

(assert (=> b!278319 (= e!177517 call!25364)))

(declare-fun b!278320 () Bool)

(declare-fun e!177518 () Bool)

(assert (=> b!278320 (= e!177518 e!177517)))

(declare-fun c!45761 () Bool)

(assert (=> b!278320 (= c!45761 (validKeyInArray!0 (select (arr!6571 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!64869 () Bool)

(declare-fun res!141899 () Bool)

(assert (=> d!64869 (=> res!141899 e!177518)))

(assert (=> d!64869 (= res!141899 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6923 a!3325)))))

(assert (=> d!64869 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!177518)))

(assert (= (and d!64869 (not res!141899)) b!278320))

(assert (= (and b!278320 c!45761) b!278317))

(assert (= (and b!278320 (not c!45761)) b!278319))

(assert (= (and b!278317 res!141898) b!278318))

(assert (= (or b!278318 b!278319) bm!25361))

(declare-fun m!293421 () Bool)

(assert (=> bm!25361 m!293421))

(assert (=> b!278317 m!293335))

(declare-fun m!293423 () Bool)

(assert (=> b!278317 m!293423))

(declare-fun m!293425 () Bool)

(assert (=> b!278317 m!293425))

(assert (=> b!278317 m!293335))

(declare-fun m!293427 () Bool)

(assert (=> b!278317 m!293427))

(assert (=> b!278320 m!293335))

(assert (=> b!278320 m!293335))

(assert (=> b!278320 m!293341))

(assert (=> bm!25336 d!64869))

(declare-fun d!64871 () Bool)

(assert (=> d!64871 (arrayContainsKey!0 lt!138176 lt!138250 #b00000000000000000000000000000000)))

(declare-fun lt!138347 () Unit!8771)

(assert (=> d!64871 (= lt!138347 (choose!13 lt!138176 lt!138250 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> d!64871 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))

(assert (=> d!64871 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138176 lt!138250 (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138347)))

(declare-fun bs!9934 () Bool)

(assert (= bs!9934 d!64871))

(assert (=> bs!9934 m!293193))

(declare-fun m!293429 () Bool)

(assert (=> bs!9934 m!293429))

(assert (=> b!278112 d!64871))

(declare-fun d!64873 () Bool)

(declare-fun res!141900 () Bool)

(declare-fun e!177520 () Bool)

(assert (=> d!64873 (=> res!141900 e!177520)))

(assert (=> d!64873 (= res!141900 (= (select (arr!6571 lt!138176) #b00000000000000000000000000000000) lt!138250))))

(assert (=> d!64873 (= (arrayContainsKey!0 lt!138176 lt!138250 #b00000000000000000000000000000000) e!177520)))

(declare-fun b!278321 () Bool)

(declare-fun e!177521 () Bool)

(assert (=> b!278321 (= e!177520 e!177521)))

(declare-fun res!141901 () Bool)

(assert (=> b!278321 (=> (not res!141901) (not e!177521))))

(assert (=> b!278321 (= res!141901 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6923 lt!138176)))))

(declare-fun b!278322 () Bool)

(assert (=> b!278322 (= e!177521 (arrayContainsKey!0 lt!138176 lt!138250 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64873 (not res!141900)) b!278321))

(assert (= (and b!278321 res!141901) b!278322))

(declare-fun m!293431 () Bool)

(assert (=> d!64873 m!293431))

(declare-fun m!293433 () Bool)

(assert (=> b!278322 m!293433))

(assert (=> b!278112 d!64873))

(declare-fun d!64875 () Bool)

(declare-fun lt!138349 () SeekEntryResult!1694)

(assert (=> d!64875 (and (or ((_ is Undefined!1694) lt!138349) (not ((_ is Found!1694) lt!138349)) (and (bvsge (index!8947 lt!138349) #b00000000000000000000000000000000) (bvslt (index!8947 lt!138349) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138349) ((_ is Found!1694) lt!138349) (not ((_ is MissingZero!1694) lt!138349)) (and (bvsge (index!8946 lt!138349) #b00000000000000000000000000000000) (bvslt (index!8946 lt!138349) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138349) ((_ is Found!1694) lt!138349) ((_ is MissingZero!1694) lt!138349) (not ((_ is MissingVacant!1694) lt!138349)) (and (bvsge (index!8949 lt!138349) #b00000000000000000000000000000000) (bvslt (index!8949 lt!138349) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138349) (ite ((_ is Found!1694) lt!138349) (= (select (arr!6571 lt!138176) (index!8947 lt!138349)) (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26))) (ite ((_ is MissingZero!1694) lt!138349) (= (select (arr!6571 lt!138176) (index!8946 lt!138349)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1694) lt!138349) (= (select (arr!6571 lt!138176) (index!8949 lt!138349)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!177524 () SeekEntryResult!1694)

(assert (=> d!64875 (= lt!138349 e!177524)))

(declare-fun c!45764 () Bool)

(declare-fun lt!138348 () SeekEntryResult!1694)

(assert (=> d!64875 (= c!45764 (and ((_ is Intermediate!1694) lt!138348) (undefined!2506 lt!138348)))))

(assert (=> d!64875 (= lt!138348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26)) mask!3868) (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138176 mask!3868))))

(assert (=> d!64875 (validMask!0 mask!3868)))

(assert (=> d!64875 (= (seekEntryOrOpen!0 (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138176 mask!3868) lt!138349)))

(declare-fun b!278323 () Bool)

(declare-fun e!177523 () SeekEntryResult!1694)

(assert (=> b!278323 (= e!177523 (MissingZero!1694 (index!8948 lt!138348)))))

(declare-fun b!278324 () Bool)

(declare-fun e!177522 () SeekEntryResult!1694)

(assert (=> b!278324 (= e!177524 e!177522)))

(declare-fun lt!138350 () (_ BitVec 64))

(assert (=> b!278324 (= lt!138350 (select (arr!6571 lt!138176) (index!8948 lt!138348)))))

(declare-fun c!45762 () Bool)

(assert (=> b!278324 (= c!45762 (= lt!138350 (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun b!278325 () Bool)

(declare-fun c!45763 () Bool)

(assert (=> b!278325 (= c!45763 (= lt!138350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278325 (= e!177522 e!177523)))

(declare-fun b!278326 () Bool)

(assert (=> b!278326 (= e!177524 Undefined!1694)))

(declare-fun b!278327 () Bool)

(assert (=> b!278327 (= e!177522 (Found!1694 (index!8948 lt!138348)))))

(declare-fun b!278328 () Bool)

(assert (=> b!278328 (= e!177523 (seekKeyOrZeroReturnVacant!0 (x!27299 lt!138348) (index!8948 lt!138348) (index!8948 lt!138348) (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138176 mask!3868))))

(assert (= (and d!64875 c!45764) b!278326))

(assert (= (and d!64875 (not c!45764)) b!278324))

(assert (= (and b!278324 c!45762) b!278327))

(assert (= (and b!278324 (not c!45762)) b!278325))

(assert (= (and b!278325 c!45763) b!278323))

(assert (= (and b!278325 (not c!45763)) b!278328))

(assert (=> d!64875 m!293043))

(assert (=> d!64875 m!293189))

(declare-fun m!293435 () Bool)

(assert (=> d!64875 m!293435))

(declare-fun m!293437 () Bool)

(assert (=> d!64875 m!293437))

(assert (=> d!64875 m!293435))

(assert (=> d!64875 m!293189))

(declare-fun m!293439 () Bool)

(assert (=> d!64875 m!293439))

(declare-fun m!293441 () Bool)

(assert (=> d!64875 m!293441))

(declare-fun m!293443 () Bool)

(assert (=> d!64875 m!293443))

(declare-fun m!293445 () Bool)

(assert (=> b!278324 m!293445))

(assert (=> b!278328 m!293189))

(declare-fun m!293447 () Bool)

(assert (=> b!278328 m!293447))

(assert (=> b!278112 d!64875))

(declare-fun d!64877 () Bool)

(declare-fun lt!138353 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!185 (List!4292) (InoxSet (_ BitVec 64)))

(assert (=> d!64877 (= lt!138353 (select (content!185 Nil!4289) (select (arr!6571 a!3325) #b00000000000000000000000000000000)))))

(declare-fun e!177529 () Bool)

(assert (=> d!64877 (= lt!138353 e!177529)))

(declare-fun res!141906 () Bool)

(assert (=> d!64877 (=> (not res!141906) (not e!177529))))

(assert (=> d!64877 (= res!141906 ((_ is Cons!4288) Nil!4289))))

(assert (=> d!64877 (= (contains!1937 Nil!4289 (select (arr!6571 a!3325) #b00000000000000000000000000000000)) lt!138353)))

(declare-fun b!278333 () Bool)

(declare-fun e!177530 () Bool)

(assert (=> b!278333 (= e!177529 e!177530)))

(declare-fun res!141907 () Bool)

(assert (=> b!278333 (=> res!141907 e!177530)))

(assert (=> b!278333 (= res!141907 (= (h!4955 Nil!4289) (select (arr!6571 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278334 () Bool)

(assert (=> b!278334 (= e!177530 (contains!1937 (t!9366 Nil!4289) (select (arr!6571 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64877 res!141906) b!278333))

(assert (= (and b!278333 (not res!141907)) b!278334))

(declare-fun m!293449 () Bool)

(assert (=> d!64877 m!293449))

(assert (=> d!64877 m!293101))

(declare-fun m!293451 () Bool)

(assert (=> d!64877 m!293451))

(assert (=> b!278334 m!293101))

(declare-fun m!293453 () Bool)

(assert (=> b!278334 m!293453))

(assert (=> b!278098 d!64877))

(declare-fun d!64879 () Bool)

(assert (=> d!64879 (arrayContainsKey!0 lt!138176 lt!138217 #b00000000000000000000000000000000)))

(declare-fun lt!138354 () Unit!8771)

(assert (=> d!64879 (= lt!138354 (choose!13 lt!138176 lt!138217 startIndex!26))))

(assert (=> d!64879 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!64879 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138176 lt!138217 startIndex!26) lt!138354)))

(declare-fun bs!9935 () Bool)

(assert (= bs!9935 d!64879))

(assert (=> bs!9935 m!293117))

(declare-fun m!293455 () Bool)

(assert (=> bs!9935 m!293455))

(assert (=> b!278027 d!64879))

(declare-fun d!64881 () Bool)

(declare-fun res!141908 () Bool)

(declare-fun e!177531 () Bool)

(assert (=> d!64881 (=> res!141908 e!177531)))

(assert (=> d!64881 (= res!141908 (= (select (arr!6571 lt!138176) #b00000000000000000000000000000000) lt!138217))))

(assert (=> d!64881 (= (arrayContainsKey!0 lt!138176 lt!138217 #b00000000000000000000000000000000) e!177531)))

(declare-fun b!278335 () Bool)

(declare-fun e!177532 () Bool)

(assert (=> b!278335 (= e!177531 e!177532)))

(declare-fun res!141909 () Bool)

(assert (=> b!278335 (=> (not res!141909) (not e!177532))))

(assert (=> b!278335 (= res!141909 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6923 lt!138176)))))

(declare-fun b!278336 () Bool)

(assert (=> b!278336 (= e!177532 (arrayContainsKey!0 lt!138176 lt!138217 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64881 (not res!141908)) b!278335))

(assert (= (and b!278335 res!141909) b!278336))

(assert (=> d!64881 m!293431))

(declare-fun m!293457 () Bool)

(assert (=> b!278336 m!293457))

(assert (=> b!278027 d!64881))

(declare-fun d!64883 () Bool)

(declare-fun lt!138356 () SeekEntryResult!1694)

(assert (=> d!64883 (and (or ((_ is Undefined!1694) lt!138356) (not ((_ is Found!1694) lt!138356)) (and (bvsge (index!8947 lt!138356) #b00000000000000000000000000000000) (bvslt (index!8947 lt!138356) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138356) ((_ is Found!1694) lt!138356) (not ((_ is MissingZero!1694) lt!138356)) (and (bvsge (index!8946 lt!138356) #b00000000000000000000000000000000) (bvslt (index!8946 lt!138356) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138356) ((_ is Found!1694) lt!138356) ((_ is MissingZero!1694) lt!138356) (not ((_ is MissingVacant!1694) lt!138356)) (and (bvsge (index!8949 lt!138356) #b00000000000000000000000000000000) (bvslt (index!8949 lt!138356) (size!6923 lt!138176)))) (or ((_ is Undefined!1694) lt!138356) (ite ((_ is Found!1694) lt!138356) (= (select (arr!6571 lt!138176) (index!8947 lt!138356)) (select (arr!6571 lt!138176) startIndex!26)) (ite ((_ is MissingZero!1694) lt!138356) (= (select (arr!6571 lt!138176) (index!8946 lt!138356)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1694) lt!138356) (= (select (arr!6571 lt!138176) (index!8949 lt!138356)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!177535 () SeekEntryResult!1694)

(assert (=> d!64883 (= lt!138356 e!177535)))

(declare-fun c!45767 () Bool)

(declare-fun lt!138355 () SeekEntryResult!1694)

(assert (=> d!64883 (= c!45767 (and ((_ is Intermediate!1694) lt!138355) (undefined!2506 lt!138355)))))

(assert (=> d!64883 (= lt!138355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6571 lt!138176) startIndex!26) mask!3868) (select (arr!6571 lt!138176) startIndex!26) lt!138176 mask!3868))))

(assert (=> d!64883 (validMask!0 mask!3868)))

(assert (=> d!64883 (= (seekEntryOrOpen!0 (select (arr!6571 lt!138176) startIndex!26) lt!138176 mask!3868) lt!138356)))

(declare-fun b!278337 () Bool)

(declare-fun e!177534 () SeekEntryResult!1694)

(assert (=> b!278337 (= e!177534 (MissingZero!1694 (index!8948 lt!138355)))))

(declare-fun b!278338 () Bool)

(declare-fun e!177533 () SeekEntryResult!1694)

(assert (=> b!278338 (= e!177535 e!177533)))

(declare-fun lt!138357 () (_ BitVec 64))

(assert (=> b!278338 (= lt!138357 (select (arr!6571 lt!138176) (index!8948 lt!138355)))))

(declare-fun c!45765 () Bool)

(assert (=> b!278338 (= c!45765 (= lt!138357 (select (arr!6571 lt!138176) startIndex!26)))))

(declare-fun b!278339 () Bool)

(declare-fun c!45766 () Bool)

(assert (=> b!278339 (= c!45766 (= lt!138357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278339 (= e!177533 e!177534)))

(declare-fun b!278340 () Bool)

(assert (=> b!278340 (= e!177535 Undefined!1694)))

(declare-fun b!278341 () Bool)

(assert (=> b!278341 (= e!177533 (Found!1694 (index!8948 lt!138355)))))

(declare-fun b!278342 () Bool)

(assert (=> b!278342 (= e!177534 (seekKeyOrZeroReturnVacant!0 (x!27299 lt!138355) (index!8948 lt!138355) (index!8948 lt!138355) (select (arr!6571 lt!138176) startIndex!26) lt!138176 mask!3868))))

(assert (= (and d!64883 c!45767) b!278340))

(assert (= (and d!64883 (not c!45767)) b!278338))

(assert (= (and b!278338 c!45765) b!278341))

(assert (= (and b!278338 (not c!45765)) b!278339))

(assert (= (and b!278339 c!45766) b!278337))

(assert (= (and b!278339 (not c!45766)) b!278342))

(assert (=> d!64883 m!293043))

(assert (=> d!64883 m!293113))

(declare-fun m!293459 () Bool)

(assert (=> d!64883 m!293459))

(declare-fun m!293461 () Bool)

(assert (=> d!64883 m!293461))

(assert (=> d!64883 m!293459))

(assert (=> d!64883 m!293113))

(declare-fun m!293463 () Bool)

(assert (=> d!64883 m!293463))

(declare-fun m!293465 () Bool)

(assert (=> d!64883 m!293465))

(declare-fun m!293467 () Bool)

(assert (=> d!64883 m!293467))

(declare-fun m!293469 () Bool)

(assert (=> b!278338 m!293469))

(assert (=> b!278342 m!293113))

(declare-fun m!293471 () Bool)

(assert (=> b!278342 m!293471))

(assert (=> b!278027 d!64883))

(declare-fun call!25365 () Bool)

(declare-fun bm!25362 () Bool)

(assert (=> bm!25362 (= call!25365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!138176 mask!3868))))

(declare-fun b!278343 () Bool)

(declare-fun e!177536 () Bool)

(declare-fun e!177538 () Bool)

(assert (=> b!278343 (= e!177536 e!177538)))

(declare-fun lt!138358 () (_ BitVec 64))

(assert (=> b!278343 (= lt!138358 (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!138360 () Unit!8771)

(assert (=> b!278343 (= lt!138360 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138176 lt!138358 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!278343 (arrayContainsKey!0 lt!138176 lt!138358 #b00000000000000000000000000000000)))

(declare-fun lt!138359 () Unit!8771)

(assert (=> b!278343 (= lt!138359 lt!138360)))

(declare-fun res!141910 () Bool)

(assert (=> b!278343 (= res!141910 (= (seekEntryOrOpen!0 (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)) lt!138176 mask!3868) (Found!1694 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!278343 (=> (not res!141910) (not e!177538))))

(declare-fun b!278344 () Bool)

(assert (=> b!278344 (= e!177538 call!25365)))

(declare-fun b!278345 () Bool)

(assert (=> b!278345 (= e!177536 call!25365)))

(declare-fun b!278346 () Bool)

(declare-fun e!177537 () Bool)

(assert (=> b!278346 (= e!177537 e!177536)))

(declare-fun c!45768 () Bool)

(assert (=> b!278346 (= c!45768 (validKeyInArray!0 (select (arr!6571 lt!138176) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun d!64885 () Bool)

(declare-fun res!141911 () Bool)

(assert (=> d!64885 (=> res!141911 e!177537)))

(assert (=> d!64885 (= res!141911 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) (size!6923 lt!138176)))))

(assert (=> d!64885 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!138176 mask!3868) e!177537)))

(assert (= (and d!64885 (not res!141911)) b!278346))

(assert (= (and b!278346 c!45768) b!278343))

(assert (= (and b!278346 (not c!45768)) b!278345))

(assert (= (and b!278343 res!141910) b!278344))

(assert (= (or b!278344 b!278345) bm!25362))

(declare-fun m!293473 () Bool)

(assert (=> bm!25362 m!293473))

(declare-fun m!293475 () Bool)

(assert (=> b!278343 m!293475))

(declare-fun m!293477 () Bool)

(assert (=> b!278343 m!293477))

(declare-fun m!293479 () Bool)

(assert (=> b!278343 m!293479))

(assert (=> b!278343 m!293475))

(declare-fun m!293481 () Bool)

(assert (=> b!278343 m!293481))

(assert (=> b!278346 m!293475))

(assert (=> b!278346 m!293475))

(declare-fun m!293483 () Bool)

(assert (=> b!278346 m!293483))

(assert (=> bm!25347 d!64885))

(check-sat (not b!278248) (not b!278247) (not b!278314) (not b!278346) (not b!278343) (not b!278317) (not d!64835) (not bm!25361) (not d!64861) (not b!278307) (not b!278301) (not b!278322) (not b!278334) (not d!64841) (not b!278297) (not d!64877) (not bm!25362) (not b!278336) (not b!278252) (not b!278288) (not d!64871) (not b!278342) (not d!64863) (not b!278254) (not d!64851) (not d!64845) (not b!278298) (not d!64867) (not b!278249) (not b!278240) (not d!64855) (not b!278285) (not b!278294) (not bm!25360) (not d!64879) (not b!278260) (not bm!25359) (not bm!25358) (not b!278320) (not d!64883) (not d!64865) (not d!64875) (not b!278328))
(check-sat)
