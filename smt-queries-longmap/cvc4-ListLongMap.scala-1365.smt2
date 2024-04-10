; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26752 () Bool)

(assert start!26752)

(declare-fun b!277958 () Bool)

(declare-datatypes ((Unit!8797 0))(
  ( (Unit!8798) )
))
(declare-fun e!177283 () Unit!8797)

(declare-fun Unit!8799 () Unit!8797)

(assert (=> b!277958 (= e!177283 Unit!8799)))

(declare-fun b!277959 () Bool)

(declare-fun res!141755 () Bool)

(declare-fun e!177287 () Bool)

(assert (=> b!277959 (=> (not res!141755) (not e!177287))))

(declare-datatypes ((array!13849 0))(
  ( (array!13850 (arr!6574 (Array (_ BitVec 32) (_ BitVec 64))) (size!6926 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13849)

(declare-datatypes ((List!4382 0))(
  ( (Nil!4379) (Cons!4378 (h!5045 (_ BitVec 64)) (t!9464 List!4382)) )
))
(declare-fun arrayNoDuplicates!0 (array!13849 (_ BitVec 32) List!4382) Bool)

(assert (=> b!277959 (= res!141755 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4379))))

(declare-fun b!277960 () Bool)

(declare-fun e!177286 () Bool)

(assert (=> b!277960 (= e!177287 e!177286)))

(declare-fun res!141756 () Bool)

(assert (=> b!277960 (=> (not res!141756) (not e!177286))))

(declare-datatypes ((SeekEntryResult!1732 0))(
  ( (MissingZero!1732 (index!9098 (_ BitVec 32))) (Found!1732 (index!9099 (_ BitVec 32))) (Intermediate!1732 (undefined!2544 Bool) (index!9100 (_ BitVec 32)) (x!27337 (_ BitVec 32))) (Undefined!1732) (MissingVacant!1732 (index!9101 (_ BitVec 32))) )
))
(declare-fun lt!138147 () SeekEntryResult!1732)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277960 (= res!141756 (or (= lt!138147 (MissingZero!1732 i!1267)) (= lt!138147 (MissingVacant!1732 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13849 (_ BitVec 32)) SeekEntryResult!1732)

(assert (=> b!277960 (= lt!138147 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277961 () Bool)

(declare-fun lt!138148 () Unit!8797)

(assert (=> b!277961 (= e!177283 lt!138148)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8797)

(assert (=> b!277961 (= lt!138148 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!138145 () array!13849)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13849 (_ BitVec 32)) Bool)

(assert (=> b!277961 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138145 mask!3868)))

(declare-fun b!277962 () Bool)

(declare-fun res!141757 () Bool)

(assert (=> b!277962 (=> (not res!141757) (not e!177287))))

(assert (=> b!277962 (= res!141757 (and (= (size!6926 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6926 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6926 a!3325))))))

(declare-fun b!277963 () Bool)

(declare-fun res!141753 () Bool)

(assert (=> b!277963 (=> (not res!141753) (not e!177287))))

(declare-fun arrayContainsKey!0 (array!13849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277963 (= res!141753 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277964 () Bool)

(declare-fun res!141754 () Bool)

(assert (=> b!277964 (=> (not res!141754) (not e!177287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277964 (= res!141754 (validKeyInArray!0 k!2581))))

(declare-fun res!141759 () Bool)

(assert (=> start!26752 (=> (not res!141759) (not e!177287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26752 (= res!141759 (validMask!0 mask!3868))))

(assert (=> start!26752 e!177287))

(declare-fun array_inv!4537 (array!13849) Bool)

(assert (=> start!26752 (array_inv!4537 a!3325)))

(assert (=> start!26752 true))

(declare-fun b!277965 () Bool)

(declare-fun res!141752 () Bool)

(assert (=> b!277965 (=> (not res!141752) (not e!177286))))

(assert (=> b!277965 (= res!141752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun e!177285 () Bool)

(declare-fun b!277966 () Bool)

(assert (=> b!277966 (= e!177285 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!138145 mask!3868)))))

(assert (=> b!277966 (= (seekEntryOrOpen!0 k!2581 lt!138145 mask!3868) (Found!1732 i!1267))))

(declare-fun lt!138144 () Unit!8797)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8797)

(assert (=> b!277966 (= lt!138144 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!138146 () Unit!8797)

(assert (=> b!277966 (= lt!138146 e!177283)))

(declare-fun c!45654 () Bool)

(assert (=> b!277966 (= c!45654 (bvslt startIndex!26 (bvsub (size!6926 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277967 () Bool)

(assert (=> b!277967 (= e!177286 e!177285)))

(declare-fun res!141758 () Bool)

(assert (=> b!277967 (=> (not res!141758) (not e!177285))))

(assert (=> b!277967 (= res!141758 (= startIndex!26 i!1267))))

(assert (=> b!277967 (= lt!138145 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325)))))

(assert (= (and start!26752 res!141759) b!277962))

(assert (= (and b!277962 res!141757) b!277964))

(assert (= (and b!277964 res!141754) b!277959))

(assert (= (and b!277959 res!141755) b!277963))

(assert (= (and b!277963 res!141753) b!277960))

(assert (= (and b!277960 res!141756) b!277965))

(assert (= (and b!277965 res!141752) b!277967))

(assert (= (and b!277967 res!141758) b!277966))

(assert (= (and b!277966 c!45654) b!277961))

(assert (= (and b!277966 (not c!45654)) b!277958))

(declare-fun m!292867 () Bool)

(assert (=> start!26752 m!292867))

(declare-fun m!292869 () Bool)

(assert (=> start!26752 m!292869))

(declare-fun m!292871 () Bool)

(assert (=> b!277961 m!292871))

(declare-fun m!292873 () Bool)

(assert (=> b!277961 m!292873))

(declare-fun m!292875 () Bool)

(assert (=> b!277966 m!292875))

(declare-fun m!292877 () Bool)

(assert (=> b!277966 m!292877))

(declare-fun m!292879 () Bool)

(assert (=> b!277966 m!292879))

(declare-fun m!292881 () Bool)

(assert (=> b!277967 m!292881))

(declare-fun m!292883 () Bool)

(assert (=> b!277959 m!292883))

(declare-fun m!292885 () Bool)

(assert (=> b!277964 m!292885))

(declare-fun m!292887 () Bool)

(assert (=> b!277960 m!292887))

(declare-fun m!292889 () Bool)

(assert (=> b!277965 m!292889))

(declare-fun m!292891 () Bool)

(assert (=> b!277963 m!292891))

(push 1)

(assert (not b!277965))

(assert (not b!277963))

(assert (not b!277960))

(assert (not b!277964))

(assert (not b!277961))

(assert (not start!26752))

(assert (not b!277966))

(assert (not b!277959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64697 () Bool)

(assert (=> d!64697 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!277964 d!64697))

(declare-fun d!64699 () Bool)

(declare-fun res!141768 () Bool)

(declare-fun e!177298 () Bool)

(assert (=> d!64699 (=> res!141768 e!177298)))

(assert (=> d!64699 (= res!141768 (= (select (arr!6574 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!64699 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!177298)))

(declare-fun b!277980 () Bool)

(declare-fun e!177299 () Bool)

(assert (=> b!277980 (= e!177298 e!177299)))

(declare-fun res!141769 () Bool)

(assert (=> b!277980 (=> (not res!141769) (not e!177299))))

(assert (=> b!277980 (= res!141769 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6926 a!3325)))))

(declare-fun b!277981 () Bool)

(assert (=> b!277981 (= e!177299 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64699 (not res!141768)) b!277980))

(assert (= (and b!277980 res!141769) b!277981))

(declare-fun m!292893 () Bool)

(assert (=> d!64699 m!292893))

(declare-fun m!292895 () Bool)

(assert (=> b!277981 m!292895))

(assert (=> b!277963 d!64699))

(declare-fun d!64701 () Bool)

(declare-fun e!177313 () Bool)

(assert (=> d!64701 e!177313))

(declare-fun res!141780 () Bool)

(assert (=> d!64701 (=> (not res!141780) (not e!177313))))

(assert (=> d!64701 (= res!141780 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6926 a!3325))))))

(declare-fun lt!138160 () Unit!8797)

(declare-fun choose!98 (array!13849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8797)

(assert (=> d!64701 (= lt!138160 (choose!98 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!64701 (validMask!0 mask!3868)))

(assert (=> d!64701 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!138160)))

(declare-fun b!277998 () Bool)

(assert (=> b!277998 (= e!177313 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325)) mask!3868))))

(assert (= (and d!64701 res!141780) b!277998))

(declare-fun m!292909 () Bool)

(assert (=> d!64701 m!292909))

(assert (=> d!64701 m!292867))

(assert (=> b!277998 m!292881))

(declare-fun m!292911 () Bool)

(assert (=> b!277998 m!292911))

(assert (=> b!277961 d!64701))

(declare-fun b!278020 () Bool)

(declare-fun e!177332 () Bool)

(declare-fun call!25359 () Bool)

(assert (=> b!278020 (= e!177332 call!25359)))

(declare-fun b!278022 () Bool)

(declare-fun e!177330 () Bool)

(assert (=> b!278022 (= e!177332 e!177330)))

(declare-fun lt!138175 () (_ BitVec 64))

(assert (=> b!278022 (= lt!138175 (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!138173 () Unit!8797)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13849 (_ BitVec 64) (_ BitVec 32)) Unit!8797)

(assert (=> b!278022 (= lt!138173 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138145 lt!138175 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!278022 (arrayContainsKey!0 lt!138145 lt!138175 #b00000000000000000000000000000000)))

(declare-fun lt!138174 () Unit!8797)

(assert (=> b!278022 (= lt!138174 lt!138173)))

(declare-fun res!141792 () Bool)

(assert (=> b!278022 (= res!141792 (= (seekEntryOrOpen!0 (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138145 mask!3868) (Found!1732 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!278022 (=> (not res!141792) (not e!177330))))

(declare-fun b!278023 () Bool)

(declare-fun e!177331 () Bool)

(assert (=> b!278023 (= e!177331 e!177332)))

(declare-fun c!45665 () Bool)

(assert (=> b!278023 (= c!45665 (validKeyInArray!0 (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun bm!25356 () Bool)

(assert (=> bm!25356 (= call!25359 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!138145 mask!3868))))

(declare-fun b!278021 () Bool)

(assert (=> b!278021 (= e!177330 call!25359)))

(declare-fun d!64707 () Bool)

(declare-fun res!141793 () Bool)

(assert (=> d!64707 (=> res!141793 e!177331)))

(assert (=> d!64707 (= res!141793 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!6926 lt!138145)))))

(assert (=> d!64707 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138145 mask!3868) e!177331)))

(assert (= (and d!64707 (not res!141793)) b!278023))

(assert (= (and b!278023 c!45665) b!278022))

(assert (= (and b!278023 (not c!45665)) b!278020))

(assert (= (and b!278022 res!141792) b!278021))

(assert (= (or b!278021 b!278020) bm!25356))

(declare-fun m!292921 () Bool)

(assert (=> b!278022 m!292921))

(declare-fun m!292923 () Bool)

(assert (=> b!278022 m!292923))

(declare-fun m!292925 () Bool)

(assert (=> b!278022 m!292925))

(assert (=> b!278022 m!292921))

(declare-fun m!292927 () Bool)

(assert (=> b!278022 m!292927))

(assert (=> b!278023 m!292921))

(assert (=> b!278023 m!292921))

(declare-fun m!292929 () Bool)

(assert (=> b!278023 m!292929))

(declare-fun m!292931 () Bool)

(assert (=> bm!25356 m!292931))

(assert (=> b!277961 d!64707))

(declare-fun b!278026 () Bool)

(declare-fun e!177335 () Bool)

(declare-fun call!25360 () Bool)

(assert (=> b!278026 (= e!177335 call!25360)))

(declare-fun b!278028 () Bool)

(declare-fun e!177333 () Bool)

(assert (=> b!278028 (= e!177335 e!177333)))

(declare-fun lt!138182 () (_ BitVec 64))

(assert (=> b!278028 (= lt!138182 (select (arr!6574 lt!138145) startIndex!26))))

(declare-fun lt!138180 () Unit!8797)

(assert (=> b!278028 (= lt!138180 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138145 lt!138182 startIndex!26))))

(assert (=> b!278028 (arrayContainsKey!0 lt!138145 lt!138182 #b00000000000000000000000000000000)))

(declare-fun lt!138181 () Unit!8797)

(assert (=> b!278028 (= lt!138181 lt!138180)))

(declare-fun res!141794 () Bool)

(assert (=> b!278028 (= res!141794 (= (seekEntryOrOpen!0 (select (arr!6574 lt!138145) startIndex!26) lt!138145 mask!3868) (Found!1732 startIndex!26)))))

(assert (=> b!278028 (=> (not res!141794) (not e!177333))))

(declare-fun b!278029 () Bool)

(declare-fun e!177334 () Bool)

(assert (=> b!278029 (= e!177334 e!177335)))

(declare-fun c!45666 () Bool)

(assert (=> b!278029 (= c!45666 (validKeyInArray!0 (select (arr!6574 lt!138145) startIndex!26)))))

(declare-fun bm!25357 () Bool)

(assert (=> bm!25357 (= call!25360 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!138145 mask!3868))))

(declare-fun b!278027 () Bool)

(assert (=> b!278027 (= e!177333 call!25360)))

(declare-fun d!64711 () Bool)

(declare-fun res!141795 () Bool)

(assert (=> d!64711 (=> res!141795 e!177334)))

(assert (=> d!64711 (= res!141795 (bvsge startIndex!26 (size!6926 lt!138145)))))

(assert (=> d!64711 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!138145 mask!3868) e!177334)))

(assert (= (and d!64711 (not res!141795)) b!278029))

(assert (= (and b!278029 c!45666) b!278028))

(assert (= (and b!278029 (not c!45666)) b!278026))

(assert (= (and b!278028 res!141794) b!278027))

(assert (= (or b!278027 b!278026) bm!25357))

(declare-fun m!292933 () Bool)

(assert (=> b!278028 m!292933))

(declare-fun m!292935 () Bool)

(assert (=> b!278028 m!292935))

(declare-fun m!292937 () Bool)

(assert (=> b!278028 m!292937))

(assert (=> b!278028 m!292933))

(declare-fun m!292939 () Bool)

(assert (=> b!278028 m!292939))

(assert (=> b!278029 m!292933))

(assert (=> b!278029 m!292933))

(declare-fun m!292941 () Bool)

(assert (=> b!278029 m!292941))

(declare-fun m!292943 () Bool)

(assert (=> bm!25357 m!292943))

(assert (=> b!277966 d!64711))

(declare-fun b!278094 () Bool)

(declare-fun e!177379 () SeekEntryResult!1732)

(declare-fun lt!138209 () SeekEntryResult!1732)

(assert (=> b!278094 (= e!177379 (Found!1732 (index!9100 lt!138209)))))

(declare-fun e!177380 () SeekEntryResult!1732)

(declare-fun b!278095 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13849 (_ BitVec 32)) SeekEntryResult!1732)

(assert (=> b!278095 (= e!177380 (seekKeyOrZeroReturnVacant!0 (x!27337 lt!138209) (index!9100 lt!138209) (index!9100 lt!138209) k!2581 lt!138145 mask!3868))))

(declare-fun b!278096 () Bool)

(declare-fun e!177378 () SeekEntryResult!1732)

(assert (=> b!278096 (= e!177378 e!177379)))

(declare-fun lt!138211 () (_ BitVec 64))

(assert (=> b!278096 (= lt!138211 (select (arr!6574 lt!138145) (index!9100 lt!138209)))))

(declare-fun c!45692 () Bool)

(assert (=> b!278096 (= c!45692 (= lt!138211 k!2581))))

(declare-fun b!278097 () Bool)

(assert (=> b!278097 (= e!177378 Undefined!1732)))

(declare-fun b!278098 () Bool)

(declare-fun c!45691 () Bool)

(assert (=> b!278098 (= c!45691 (= lt!138211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278098 (= e!177379 e!177380)))

(declare-fun d!64713 () Bool)

(declare-fun lt!138210 () SeekEntryResult!1732)

(assert (=> d!64713 (and (or (is-Undefined!1732 lt!138210) (not (is-Found!1732 lt!138210)) (and (bvsge (index!9099 lt!138210) #b00000000000000000000000000000000) (bvslt (index!9099 lt!138210) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138210) (is-Found!1732 lt!138210) (not (is-MissingZero!1732 lt!138210)) (and (bvsge (index!9098 lt!138210) #b00000000000000000000000000000000) (bvslt (index!9098 lt!138210) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138210) (is-Found!1732 lt!138210) (is-MissingZero!1732 lt!138210) (not (is-MissingVacant!1732 lt!138210)) (and (bvsge (index!9101 lt!138210) #b00000000000000000000000000000000) (bvslt (index!9101 lt!138210) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138210) (ite (is-Found!1732 lt!138210) (= (select (arr!6574 lt!138145) (index!9099 lt!138210)) k!2581) (ite (is-MissingZero!1732 lt!138210) (= (select (arr!6574 lt!138145) (index!9098 lt!138210)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1732 lt!138210) (= (select (arr!6574 lt!138145) (index!9101 lt!138210)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64713 (= lt!138210 e!177378)))

(declare-fun c!45693 () Bool)

(assert (=> d!64713 (= c!45693 (and (is-Intermediate!1732 lt!138209) (undefined!2544 lt!138209)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13849 (_ BitVec 32)) SeekEntryResult!1732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64713 (= lt!138209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 lt!138145 mask!3868))))

(assert (=> d!64713 (validMask!0 mask!3868)))

(assert (=> d!64713 (= (seekEntryOrOpen!0 k!2581 lt!138145 mask!3868) lt!138210)))

(declare-fun b!278099 () Bool)

(assert (=> b!278099 (= e!177380 (MissingZero!1732 (index!9100 lt!138209)))))

(assert (= (and d!64713 c!45693) b!278097))

(assert (= (and d!64713 (not c!45693)) b!278096))

(assert (= (and b!278096 c!45692) b!278094))

(assert (= (and b!278096 (not c!45692)) b!278098))

(assert (= (and b!278098 c!45691) b!278099))

(assert (= (and b!278098 (not c!45691)) b!278095))

(declare-fun m!293011 () Bool)

(assert (=> b!278095 m!293011))

(declare-fun m!293013 () Bool)

(assert (=> b!278096 m!293013))

(declare-fun m!293015 () Bool)

(assert (=> d!64713 m!293015))

(declare-fun m!293017 () Bool)

(assert (=> d!64713 m!293017))

(assert (=> d!64713 m!292867))

(declare-fun m!293019 () Bool)

(assert (=> d!64713 m!293019))

(assert (=> d!64713 m!293015))

(declare-fun m!293021 () Bool)

(assert (=> d!64713 m!293021))

(declare-fun m!293023 () Bool)

(assert (=> d!64713 m!293023))

(assert (=> b!277966 d!64713))

(declare-fun d!64733 () Bool)

(declare-fun e!177389 () Bool)

(assert (=> d!64733 e!177389))

(declare-fun res!141822 () Bool)

(assert (=> d!64733 (=> (not res!141822) (not e!177389))))

(assert (=> d!64733 (= res!141822 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6926 a!3325))))))

(declare-fun lt!138214 () Unit!8797)

(declare-fun choose!8 (array!13849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8797)

(assert (=> d!64733 (= lt!138214 (choose!8 a!3325 i!1267 k!2581 mask!3868))))

(assert (=> d!64733 (validMask!0 mask!3868)))

(assert (=> d!64733 (= (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868) lt!138214)))

(declare-fun b!278108 () Bool)

(assert (=> b!278108 (= e!177389 (= (seekEntryOrOpen!0 k!2581 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325)) mask!3868) (Found!1732 i!1267)))))

(assert (= (and d!64733 res!141822) b!278108))

(declare-fun m!293027 () Bool)

(assert (=> d!64733 m!293027))

(assert (=> d!64733 m!292867))

(assert (=> b!278108 m!292881))

(declare-fun m!293029 () Bool)

(assert (=> b!278108 m!293029))

(assert (=> b!277966 d!64733))

(declare-fun b!278117 () Bool)

(declare-fun e!177396 () Bool)

(declare-fun call!25367 () Bool)

(assert (=> b!278117 (= e!177396 call!25367)))

(declare-fun b!278119 () Bool)

(declare-fun e!177394 () Bool)

(assert (=> b!278119 (= e!177396 e!177394)))

(declare-fun lt!138223 () (_ BitVec 64))

(assert (=> b!278119 (= lt!138223 (select (arr!6574 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!138221 () Unit!8797)

(assert (=> b!278119 (= lt!138221 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138223 #b00000000000000000000000000000000))))

(assert (=> b!278119 (arrayContainsKey!0 a!3325 lt!138223 #b00000000000000000000000000000000)))

(declare-fun lt!138222 () Unit!8797)

(assert (=> b!278119 (= lt!138222 lt!138221)))

(declare-fun res!141823 () Bool)

(assert (=> b!278119 (= res!141823 (= (seekEntryOrOpen!0 (select (arr!6574 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1732 #b00000000000000000000000000000000)))))

(assert (=> b!278119 (=> (not res!141823) (not e!177394))))

(declare-fun b!278120 () Bool)

(declare-fun e!177395 () Bool)

(assert (=> b!278120 (= e!177395 e!177396)))

(declare-fun c!45698 () Bool)

(assert (=> b!278120 (= c!45698 (validKeyInArray!0 (select (arr!6574 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25364 () Bool)

(assert (=> bm!25364 (= call!25367 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!278118 () Bool)

(assert (=> b!278118 (= e!177394 call!25367)))

(declare-fun d!64739 () Bool)

(declare-fun res!141824 () Bool)

(assert (=> d!64739 (=> res!141824 e!177395)))

(assert (=> d!64739 (= res!141824 (bvsge #b00000000000000000000000000000000 (size!6926 a!3325)))))

(assert (=> d!64739 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177395)))

(assert (= (and d!64739 (not res!141824)) b!278120))

(assert (= (and b!278120 c!45698) b!278119))

(assert (= (and b!278120 (not c!45698)) b!278117))

(assert (= (and b!278119 res!141823) b!278118))

(assert (= (or b!278118 b!278117) bm!25364))

(assert (=> b!278119 m!292893))

(declare-fun m!293031 () Bool)

(assert (=> b!278119 m!293031))

(declare-fun m!293033 () Bool)

(assert (=> b!278119 m!293033))

(assert (=> b!278119 m!292893))

(declare-fun m!293035 () Bool)

(assert (=> b!278119 m!293035))

(assert (=> b!278120 m!292893))

(assert (=> b!278120 m!292893))

(declare-fun m!293037 () Bool)

(assert (=> b!278120 m!293037))

(declare-fun m!293039 () Bool)

(assert (=> bm!25364 m!293039))

(assert (=> b!277965 d!64739))

(declare-fun d!64741 () Bool)

(assert (=> d!64741 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26752 d!64741))

(declare-fun d!64747 () Bool)

(assert (=> d!64747 (= (array_inv!4537 a!3325) (bvsge (size!6926 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26752 d!64747))

(declare-fun b!278141 () Bool)

(declare-fun e!177412 () SeekEntryResult!1732)

(declare-fun lt!138236 () SeekEntryResult!1732)

(assert (=> b!278141 (= e!177412 (Found!1732 (index!9100 lt!138236)))))

(declare-fun b!278142 () Bool)

(declare-fun e!177413 () SeekEntryResult!1732)

(assert (=> b!278142 (= e!177413 (seekKeyOrZeroReturnVacant!0 (x!27337 lt!138236) (index!9100 lt!138236) (index!9100 lt!138236) k!2581 a!3325 mask!3868))))

(declare-fun b!278143 () Bool)

(declare-fun e!177411 () SeekEntryResult!1732)

(assert (=> b!278143 (= e!177411 e!177412)))

(declare-fun lt!138238 () (_ BitVec 64))

(assert (=> b!278143 (= lt!138238 (select (arr!6574 a!3325) (index!9100 lt!138236)))))

(declare-fun c!45706 () Bool)

(assert (=> b!278143 (= c!45706 (= lt!138238 k!2581))))

(declare-fun b!278144 () Bool)

(assert (=> b!278144 (= e!177411 Undefined!1732)))

(declare-fun b!278145 () Bool)

(declare-fun c!45705 () Bool)

(assert (=> b!278145 (= c!45705 (= lt!138238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278145 (= e!177412 e!177413)))

(declare-fun d!64749 () Bool)

(declare-fun lt!138237 () SeekEntryResult!1732)

(assert (=> d!64749 (and (or (is-Undefined!1732 lt!138237) (not (is-Found!1732 lt!138237)) (and (bvsge (index!9099 lt!138237) #b00000000000000000000000000000000) (bvslt (index!9099 lt!138237) (size!6926 a!3325)))) (or (is-Undefined!1732 lt!138237) (is-Found!1732 lt!138237) (not (is-MissingZero!1732 lt!138237)) (and (bvsge (index!9098 lt!138237) #b00000000000000000000000000000000) (bvslt (index!9098 lt!138237) (size!6926 a!3325)))) (or (is-Undefined!1732 lt!138237) (is-Found!1732 lt!138237) (is-MissingZero!1732 lt!138237) (not (is-MissingVacant!1732 lt!138237)) (and (bvsge (index!9101 lt!138237) #b00000000000000000000000000000000) (bvslt (index!9101 lt!138237) (size!6926 a!3325)))) (or (is-Undefined!1732 lt!138237) (ite (is-Found!1732 lt!138237) (= (select (arr!6574 a!3325) (index!9099 lt!138237)) k!2581) (ite (is-MissingZero!1732 lt!138237) (= (select (arr!6574 a!3325) (index!9098 lt!138237)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1732 lt!138237) (= (select (arr!6574 a!3325) (index!9101 lt!138237)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64749 (= lt!138237 e!177411)))

(declare-fun c!45707 () Bool)

(assert (=> d!64749 (= c!45707 (and (is-Intermediate!1732 lt!138236) (undefined!2544 lt!138236)))))

(assert (=> d!64749 (= lt!138236 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!64749 (validMask!0 mask!3868)))

(assert (=> d!64749 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!138237)))

(declare-fun b!278146 () Bool)

(assert (=> b!278146 (= e!177413 (MissingZero!1732 (index!9100 lt!138236)))))

(assert (= (and d!64749 c!45707) b!278144))

(assert (= (and d!64749 (not c!45707)) b!278143))

(assert (= (and b!278143 c!45706) b!278141))

(assert (= (and b!278143 (not c!45706)) b!278145))

(assert (= (and b!278145 c!45705) b!278146))

(assert (= (and b!278145 (not c!45705)) b!278142))

(declare-fun m!293075 () Bool)

(assert (=> b!278142 m!293075))

(declare-fun m!293077 () Bool)

(assert (=> b!278143 m!293077))

(assert (=> d!64749 m!293015))

(declare-fun m!293079 () Bool)

(assert (=> d!64749 m!293079))

(assert (=> d!64749 m!292867))

(declare-fun m!293081 () Bool)

(assert (=> d!64749 m!293081))

(assert (=> d!64749 m!293015))

(declare-fun m!293083 () Bool)

(assert (=> d!64749 m!293083))

(declare-fun m!293085 () Bool)

(assert (=> d!64749 m!293085))

(assert (=> b!277960 d!64749))

(declare-fun b!278159 () Bool)

(declare-fun e!177426 () Bool)

(declare-fun e!177427 () Bool)

(assert (=> b!278159 (= e!177426 e!177427)))

(declare-fun c!45710 () Bool)

(assert (=> b!278159 (= c!45710 (validKeyInArray!0 (select (arr!6574 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64753 () Bool)

(declare-fun res!141842 () Bool)

(declare-fun e!177424 () Bool)

(assert (=> d!64753 (=> res!141842 e!177424)))

(assert (=> d!64753 (= res!141842 (bvsge #b00000000000000000000000000000000 (size!6926 a!3325)))))

(assert (=> d!64753 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4379) e!177424)))

(declare-fun b!278160 () Bool)

(assert (=> b!278160 (= e!177424 e!177426)))

(declare-fun res!141841 () Bool)

(assert (=> b!278160 (=> (not res!141841) (not e!177426))))

(declare-fun e!177425 () Bool)

(assert (=> b!278160 (= res!141841 (not e!177425))))

(declare-fun res!141843 () Bool)

(assert (=> b!278160 (=> (not res!141843) (not e!177425))))

(assert (=> b!278160 (= res!141843 (validKeyInArray!0 (select (arr!6574 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278161 () Bool)

(declare-fun call!25371 () Bool)

(assert (=> b!278161 (= e!177427 call!25371)))

(declare-fun bm!25368 () Bool)

(assert (=> bm!25368 (= call!25371 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45710 (Cons!4378 (select (arr!6574 a!3325) #b00000000000000000000000000000000) Nil!4379) Nil!4379)))))

(declare-fun b!278162 () Bool)

(assert (=> b!278162 (= e!177427 call!25371)))

(declare-fun b!278163 () Bool)

(declare-fun contains!1963 (List!4382 (_ BitVec 64)) Bool)

(assert (=> b!278163 (= e!177425 (contains!1963 Nil!4379 (select (arr!6574 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64753 (not res!141842)) b!278160))

(assert (= (and b!278160 res!141843) b!278163))

(assert (= (and b!278160 res!141841) b!278159))

(assert (= (and b!278159 c!45710) b!278161))

(assert (= (and b!278159 (not c!45710)) b!278162))

(assert (= (or b!278161 b!278162) bm!25368))

(assert (=> b!278159 m!292893))

(assert (=> b!278159 m!292893))

(assert (=> b!278159 m!293037))

(assert (=> b!278160 m!292893))

(assert (=> b!278160 m!292893))

(assert (=> b!278160 m!293037))

(assert (=> bm!25368 m!292893))

(declare-fun m!293087 () Bool)

(assert (=> bm!25368 m!293087))

(assert (=> b!278163 m!292893))

(assert (=> b!278163 m!292893))

(declare-fun m!293089 () Bool)

(assert (=> b!278163 m!293089))

(assert (=> b!277959 d!64753))

(push 1)

(assert (not b!277998))

(assert (not b!278160))

(assert (not b!277981))

(assert (not b!278028))

(assert (not b!278119))

(assert (not b!278095))

(assert (not d!64713))

(assert (not bm!25368))

(assert (not b!278023))

(assert (not d!64749))

(assert (not bm!25357))

(assert (not b!278022))

(assert (not b!278163))

(assert (not b!278029))

(assert (not b!278159))

(assert (not b!278108))

(assert (not d!64701))

(assert (not bm!25356))

(assert (not b!278120))

(assert (not bm!25364))

(assert (not b!278142))

(assert (not d!64733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64871 () Bool)

(assert (=> d!64871 (= (seekEntryOrOpen!0 k!2581 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325)) mask!3868) (Found!1732 i!1267))))

(assert (=> d!64871 true))

(declare-fun _$54!23 () Unit!8797)

(assert (=> d!64871 (= (choose!8 a!3325 i!1267 k!2581 mask!3868) _$54!23)))

(declare-fun bs!9922 () Bool)

(assert (= bs!9922 d!64871))

(assert (=> bs!9922 m!292881))

(assert (=> bs!9922 m!293029))

(assert (=> d!64733 d!64871))

(assert (=> d!64733 d!64741))

(declare-fun d!64873 () Bool)

(declare-fun res!141929 () Bool)

(declare-fun e!177589 () Bool)

(assert (=> d!64873 (=> res!141929 e!177589)))

(assert (=> d!64873 (= res!141929 (= (select (arr!6574 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2581))))

(assert (=> d!64873 (= (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!177589)))

(declare-fun b!278419 () Bool)

(declare-fun e!177590 () Bool)

(assert (=> b!278419 (= e!177589 e!177590)))

(declare-fun res!141930 () Bool)

(assert (=> b!278419 (=> (not res!141930) (not e!177590))))

(assert (=> b!278419 (= res!141930 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6926 a!3325)))))

(declare-fun b!278420 () Bool)

(assert (=> b!278420 (= e!177590 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!64873 (not res!141929)) b!278419))

(assert (= (and b!278419 res!141930) b!278420))

(declare-fun m!293437 () Bool)

(assert (=> d!64873 m!293437))

(declare-fun m!293439 () Bool)

(assert (=> b!278420 m!293439))

(assert (=> b!277981 d!64873))

(declare-fun b!278433 () Bool)

(declare-fun e!177598 () SeekEntryResult!1732)

(assert (=> b!278433 (= e!177598 (Found!1732 (index!9100 lt!138236)))))

(declare-fun b!278435 () Bool)

(declare-fun c!45804 () Bool)

(declare-fun lt!138360 () (_ BitVec 64))

(assert (=> b!278435 (= c!45804 (= lt!138360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177597 () SeekEntryResult!1732)

(assert (=> b!278435 (= e!177598 e!177597)))

(declare-fun b!278436 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!278436 (= e!177597 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27337 lt!138236) #b00000000000000000000000000000001) (nextIndex!0 (index!9100 lt!138236) (x!27337 lt!138236) mask!3868) (index!9100 lt!138236) k!2581 a!3325 mask!3868))))

(declare-fun b!278437 () Bool)

(assert (=> b!278437 (= e!177597 (MissingVacant!1732 (index!9100 lt!138236)))))

(declare-fun b!278438 () Bool)

(declare-fun e!177599 () SeekEntryResult!1732)

(assert (=> b!278438 (= e!177599 Undefined!1732)))

(declare-fun b!278434 () Bool)

(assert (=> b!278434 (= e!177599 e!177598)))

(declare-fun c!45805 () Bool)

(assert (=> b!278434 (= c!45805 (= lt!138360 k!2581))))

(declare-fun d!64875 () Bool)

(declare-fun lt!138361 () SeekEntryResult!1732)

(assert (=> d!64875 (and (or (is-Undefined!1732 lt!138361) (not (is-Found!1732 lt!138361)) (and (bvsge (index!9099 lt!138361) #b00000000000000000000000000000000) (bvslt (index!9099 lt!138361) (size!6926 a!3325)))) (or (is-Undefined!1732 lt!138361) (is-Found!1732 lt!138361) (not (is-MissingVacant!1732 lt!138361)) (not (= (index!9101 lt!138361) (index!9100 lt!138236))) (and (bvsge (index!9101 lt!138361) #b00000000000000000000000000000000) (bvslt (index!9101 lt!138361) (size!6926 a!3325)))) (or (is-Undefined!1732 lt!138361) (ite (is-Found!1732 lt!138361) (= (select (arr!6574 a!3325) (index!9099 lt!138361)) k!2581) (and (is-MissingVacant!1732 lt!138361) (= (index!9101 lt!138361) (index!9100 lt!138236)) (= (select (arr!6574 a!3325) (index!9101 lt!138361)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!64875 (= lt!138361 e!177599)))

(declare-fun c!45803 () Bool)

(assert (=> d!64875 (= c!45803 (bvsge (x!27337 lt!138236) #b01111111111111111111111111111110))))

(assert (=> d!64875 (= lt!138360 (select (arr!6574 a!3325) (index!9100 lt!138236)))))

(assert (=> d!64875 (validMask!0 mask!3868)))

(assert (=> d!64875 (= (seekKeyOrZeroReturnVacant!0 (x!27337 lt!138236) (index!9100 lt!138236) (index!9100 lt!138236) k!2581 a!3325 mask!3868) lt!138361)))

(assert (= (and d!64875 c!45803) b!278438))

(assert (= (and d!64875 (not c!45803)) b!278434))

(assert (= (and b!278434 c!45805) b!278433))

(assert (= (and b!278434 (not c!45805)) b!278435))

(assert (= (and b!278435 c!45804) b!278437))

(assert (= (and b!278435 (not c!45804)) b!278436))

(declare-fun m!293441 () Bool)

(assert (=> b!278436 m!293441))

(assert (=> b!278436 m!293441))

(declare-fun m!293443 () Bool)

(assert (=> b!278436 m!293443))

(declare-fun m!293445 () Bool)

(assert (=> d!64875 m!293445))

(declare-fun m!293447 () Bool)

(assert (=> d!64875 m!293447))

(assert (=> d!64875 m!293077))

(assert (=> d!64875 m!292867))

(assert (=> b!278142 d!64875))

(declare-fun b!278439 () Bool)

(declare-fun e!177602 () Bool)

(declare-fun call!25383 () Bool)

(assert (=> b!278439 (= e!177602 call!25383)))

(declare-fun b!278441 () Bool)

(declare-fun e!177600 () Bool)

(assert (=> b!278441 (= e!177602 e!177600)))

(declare-fun lt!138364 () (_ BitVec 64))

(assert (=> b!278441 (= lt!138364 (select (arr!6574 lt!138145) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!138362 () Unit!8797)

(assert (=> b!278441 (= lt!138362 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138145 lt!138364 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!278441 (arrayContainsKey!0 lt!138145 lt!138364 #b00000000000000000000000000000000)))

(declare-fun lt!138363 () Unit!8797)

(assert (=> b!278441 (= lt!138363 lt!138362)))

(declare-fun res!141931 () Bool)

(assert (=> b!278441 (= res!141931 (= (seekEntryOrOpen!0 (select (arr!6574 lt!138145) (bvadd startIndex!26 #b00000000000000000000000000000001)) lt!138145 mask!3868) (Found!1732 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!278441 (=> (not res!141931) (not e!177600))))

(declare-fun b!278442 () Bool)

(declare-fun e!177601 () Bool)

(assert (=> b!278442 (= e!177601 e!177602)))

(declare-fun c!45806 () Bool)

(assert (=> b!278442 (= c!45806 (validKeyInArray!0 (select (arr!6574 lt!138145) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun bm!25380 () Bool)

(assert (=> bm!25380 (= call!25383 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!138145 mask!3868))))

(declare-fun b!278440 () Bool)

(assert (=> b!278440 (= e!177600 call!25383)))

(declare-fun d!64877 () Bool)

(declare-fun res!141932 () Bool)

(assert (=> d!64877 (=> res!141932 e!177601)))

(assert (=> d!64877 (= res!141932 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!6926 lt!138145)))))

(assert (=> d!64877 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!138145 mask!3868) e!177601)))

(assert (= (and d!64877 (not res!141932)) b!278442))

(assert (= (and b!278442 c!45806) b!278441))

(assert (= (and b!278442 (not c!45806)) b!278439))

(assert (= (and b!278441 res!141931) b!278440))

(assert (= (or b!278440 b!278439) bm!25380))

(declare-fun m!293449 () Bool)

(assert (=> b!278441 m!293449))

(declare-fun m!293451 () Bool)

(assert (=> b!278441 m!293451))

(declare-fun m!293453 () Bool)

(assert (=> b!278441 m!293453))

(assert (=> b!278441 m!293449))

(declare-fun m!293455 () Bool)

(assert (=> b!278441 m!293455))

(assert (=> b!278442 m!293449))

(assert (=> b!278442 m!293449))

(declare-fun m!293457 () Bool)

(assert (=> b!278442 m!293457))

(declare-fun m!293459 () Bool)

(assert (=> bm!25380 m!293459))

(assert (=> bm!25357 d!64877))

(declare-fun d!64879 () Bool)

(assert (=> d!64879 (= (validKeyInArray!0 (select (arr!6574 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6574 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6574 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278159 d!64879))

(declare-fun d!64881 () Bool)

(assert (=> d!64881 (= (validKeyInArray!0 (select (arr!6574 lt!138145) startIndex!26)) (and (not (= (select (arr!6574 lt!138145) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6574 lt!138145) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278029 d!64881))

(declare-fun d!64883 () Bool)

(assert (=> d!64883 (arrayContainsKey!0 lt!138145 lt!138182 #b00000000000000000000000000000000)))

(declare-fun lt!138367 () Unit!8797)

(declare-fun choose!13 (array!13849 (_ BitVec 64) (_ BitVec 32)) Unit!8797)

(assert (=> d!64883 (= lt!138367 (choose!13 lt!138145 lt!138182 startIndex!26))))

(assert (=> d!64883 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!64883 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138145 lt!138182 startIndex!26) lt!138367)))

(declare-fun bs!9923 () Bool)

(assert (= bs!9923 d!64883))

(assert (=> bs!9923 m!292937))

(declare-fun m!293461 () Bool)

(assert (=> bs!9923 m!293461))

(assert (=> b!278028 d!64883))

(declare-fun d!64885 () Bool)

(declare-fun res!141933 () Bool)

(declare-fun e!177603 () Bool)

(assert (=> d!64885 (=> res!141933 e!177603)))

(assert (=> d!64885 (= res!141933 (= (select (arr!6574 lt!138145) #b00000000000000000000000000000000) lt!138182))))

(assert (=> d!64885 (= (arrayContainsKey!0 lt!138145 lt!138182 #b00000000000000000000000000000000) e!177603)))

(declare-fun b!278443 () Bool)

(declare-fun e!177604 () Bool)

(assert (=> b!278443 (= e!177603 e!177604)))

(declare-fun res!141934 () Bool)

(assert (=> b!278443 (=> (not res!141934) (not e!177604))))

(assert (=> b!278443 (= res!141934 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6926 lt!138145)))))

(declare-fun b!278444 () Bool)

(assert (=> b!278444 (= e!177604 (arrayContainsKey!0 lt!138145 lt!138182 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64885 (not res!141933)) b!278443))

(assert (= (and b!278443 res!141934) b!278444))

(declare-fun m!293463 () Bool)

(assert (=> d!64885 m!293463))

(declare-fun m!293465 () Bool)

(assert (=> b!278444 m!293465))

(assert (=> b!278028 d!64885))

(declare-fun b!278445 () Bool)

(declare-fun e!177606 () SeekEntryResult!1732)

(declare-fun lt!138368 () SeekEntryResult!1732)

(assert (=> b!278445 (= e!177606 (Found!1732 (index!9100 lt!138368)))))

(declare-fun b!278446 () Bool)

(declare-fun e!177607 () SeekEntryResult!1732)

(assert (=> b!278446 (= e!177607 (seekKeyOrZeroReturnVacant!0 (x!27337 lt!138368) (index!9100 lt!138368) (index!9100 lt!138368) (select (arr!6574 lt!138145) startIndex!26) lt!138145 mask!3868))))

(declare-fun b!278447 () Bool)

(declare-fun e!177605 () SeekEntryResult!1732)

(assert (=> b!278447 (= e!177605 e!177606)))

(declare-fun lt!138370 () (_ BitVec 64))

(assert (=> b!278447 (= lt!138370 (select (arr!6574 lt!138145) (index!9100 lt!138368)))))

(declare-fun c!45808 () Bool)

(assert (=> b!278447 (= c!45808 (= lt!138370 (select (arr!6574 lt!138145) startIndex!26)))))

(declare-fun b!278448 () Bool)

(assert (=> b!278448 (= e!177605 Undefined!1732)))

(declare-fun b!278449 () Bool)

(declare-fun c!45807 () Bool)

(assert (=> b!278449 (= c!45807 (= lt!138370 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278449 (= e!177606 e!177607)))

(declare-fun d!64887 () Bool)

(declare-fun lt!138369 () SeekEntryResult!1732)

(assert (=> d!64887 (and (or (is-Undefined!1732 lt!138369) (not (is-Found!1732 lt!138369)) (and (bvsge (index!9099 lt!138369) #b00000000000000000000000000000000) (bvslt (index!9099 lt!138369) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138369) (is-Found!1732 lt!138369) (not (is-MissingZero!1732 lt!138369)) (and (bvsge (index!9098 lt!138369) #b00000000000000000000000000000000) (bvslt (index!9098 lt!138369) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138369) (is-Found!1732 lt!138369) (is-MissingZero!1732 lt!138369) (not (is-MissingVacant!1732 lt!138369)) (and (bvsge (index!9101 lt!138369) #b00000000000000000000000000000000) (bvslt (index!9101 lt!138369) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138369) (ite (is-Found!1732 lt!138369) (= (select (arr!6574 lt!138145) (index!9099 lt!138369)) (select (arr!6574 lt!138145) startIndex!26)) (ite (is-MissingZero!1732 lt!138369) (= (select (arr!6574 lt!138145) (index!9098 lt!138369)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1732 lt!138369) (= (select (arr!6574 lt!138145) (index!9101 lt!138369)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64887 (= lt!138369 e!177605)))

(declare-fun c!45809 () Bool)

(assert (=> d!64887 (= c!45809 (and (is-Intermediate!1732 lt!138368) (undefined!2544 lt!138368)))))

(assert (=> d!64887 (= lt!138368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6574 lt!138145) startIndex!26) mask!3868) (select (arr!6574 lt!138145) startIndex!26) lt!138145 mask!3868))))

(assert (=> d!64887 (validMask!0 mask!3868)))

(assert (=> d!64887 (= (seekEntryOrOpen!0 (select (arr!6574 lt!138145) startIndex!26) lt!138145 mask!3868) lt!138369)))

(declare-fun b!278450 () Bool)

(assert (=> b!278450 (= e!177607 (MissingZero!1732 (index!9100 lt!138368)))))

(assert (= (and d!64887 c!45809) b!278448))

(assert (= (and d!64887 (not c!45809)) b!278447))

(assert (= (and b!278447 c!45808) b!278445))

(assert (= (and b!278447 (not c!45808)) b!278449))

(assert (= (and b!278449 c!45807) b!278450))

(assert (= (and b!278449 (not c!45807)) b!278446))

(assert (=> b!278446 m!292933))

(declare-fun m!293467 () Bool)

(assert (=> b!278446 m!293467))

(declare-fun m!293469 () Bool)

(assert (=> b!278447 m!293469))

(declare-fun m!293471 () Bool)

(assert (=> d!64887 m!293471))

(assert (=> d!64887 m!292933))

(declare-fun m!293473 () Bool)

(assert (=> d!64887 m!293473))

(assert (=> d!64887 m!292867))

(declare-fun m!293475 () Bool)

(assert (=> d!64887 m!293475))

(assert (=> d!64887 m!292933))

(assert (=> d!64887 m!293471))

(declare-fun m!293477 () Bool)

(assert (=> d!64887 m!293477))

(declare-fun m!293479 () Bool)

(assert (=> d!64887 m!293479))

(assert (=> b!278028 d!64887))

(declare-fun b!278451 () Bool)

(declare-fun e!177610 () Bool)

(declare-fun call!25384 () Bool)

(assert (=> b!278451 (= e!177610 call!25384)))

(declare-fun b!278453 () Bool)

(declare-fun e!177608 () Bool)

(assert (=> b!278453 (= e!177610 e!177608)))

(declare-fun lt!138373 () (_ BitVec 64))

(assert (=> b!278453 (= lt!138373 (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!138371 () Unit!8797)

(assert (=> b!278453 (= lt!138371 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138145 lt!138373 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!278453 (arrayContainsKey!0 lt!138145 lt!138373 #b00000000000000000000000000000000)))

(declare-fun lt!138372 () Unit!8797)

(assert (=> b!278453 (= lt!138372 lt!138371)))

(declare-fun res!141935 () Bool)

(assert (=> b!278453 (= res!141935 (= (seekEntryOrOpen!0 (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001)) lt!138145 mask!3868) (Found!1732 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!278453 (=> (not res!141935) (not e!177608))))

(declare-fun b!278454 () Bool)

(declare-fun e!177609 () Bool)

(assert (=> b!278454 (= e!177609 e!177610)))

(declare-fun c!45810 () Bool)

(assert (=> b!278454 (= c!45810 (validKeyInArray!0 (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun bm!25381 () Bool)

(assert (=> bm!25381 (= call!25384 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!138145 mask!3868))))

(declare-fun b!278452 () Bool)

(assert (=> b!278452 (= e!177608 call!25384)))

(declare-fun d!64889 () Bool)

(declare-fun res!141936 () Bool)

(assert (=> d!64889 (=> res!141936 e!177609)))

(assert (=> d!64889 (= res!141936 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) (size!6926 lt!138145)))))

(assert (=> d!64889 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!138145 mask!3868) e!177609)))

(assert (= (and d!64889 (not res!141936)) b!278454))

(assert (= (and b!278454 c!45810) b!278453))

(assert (= (and b!278454 (not c!45810)) b!278451))

(assert (= (and b!278453 res!141935) b!278452))

(assert (= (or b!278452 b!278451) bm!25381))

(declare-fun m!293481 () Bool)

(assert (=> b!278453 m!293481))

(declare-fun m!293483 () Bool)

(assert (=> b!278453 m!293483))

(declare-fun m!293485 () Bool)

(assert (=> b!278453 m!293485))

(assert (=> b!278453 m!293481))

(declare-fun m!293487 () Bool)

(assert (=> b!278453 m!293487))

(assert (=> b!278454 m!293481))

(assert (=> b!278454 m!293481))

(declare-fun m!293489 () Bool)

(assert (=> b!278454 m!293489))

(declare-fun m!293491 () Bool)

(assert (=> bm!25381 m!293491))

(assert (=> bm!25356 d!64889))

(declare-fun b!278455 () Bool)

(declare-fun e!177612 () SeekEntryResult!1732)

(declare-fun lt!138374 () SeekEntryResult!1732)

(assert (=> b!278455 (= e!177612 (Found!1732 (index!9100 lt!138374)))))

(declare-fun b!278456 () Bool)

(declare-fun e!177613 () SeekEntryResult!1732)

(assert (=> b!278456 (= e!177613 (seekKeyOrZeroReturnVacant!0 (x!27337 lt!138374) (index!9100 lt!138374) (index!9100 lt!138374) k!2581 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325)) mask!3868))))

(declare-fun b!278457 () Bool)

(declare-fun e!177611 () SeekEntryResult!1732)

(assert (=> b!278457 (= e!177611 e!177612)))

(declare-fun lt!138376 () (_ BitVec 64))

(assert (=> b!278457 (= lt!138376 (select (arr!6574 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325))) (index!9100 lt!138374)))))

(declare-fun c!45812 () Bool)

(assert (=> b!278457 (= c!45812 (= lt!138376 k!2581))))

(declare-fun b!278458 () Bool)

(assert (=> b!278458 (= e!177611 Undefined!1732)))

(declare-fun b!278459 () Bool)

(declare-fun c!45811 () Bool)

(assert (=> b!278459 (= c!45811 (= lt!138376 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278459 (= e!177612 e!177613)))

(declare-fun d!64891 () Bool)

(declare-fun lt!138375 () SeekEntryResult!1732)

(assert (=> d!64891 (and (or (is-Undefined!1732 lt!138375) (not (is-Found!1732 lt!138375)) (and (bvsge (index!9099 lt!138375) #b00000000000000000000000000000000) (bvslt (index!9099 lt!138375) (size!6926 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325)))))) (or (is-Undefined!1732 lt!138375) (is-Found!1732 lt!138375) (not (is-MissingZero!1732 lt!138375)) (and (bvsge (index!9098 lt!138375) #b00000000000000000000000000000000) (bvslt (index!9098 lt!138375) (size!6926 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325)))))) (or (is-Undefined!1732 lt!138375) (is-Found!1732 lt!138375) (is-MissingZero!1732 lt!138375) (not (is-MissingVacant!1732 lt!138375)) (and (bvsge (index!9101 lt!138375) #b00000000000000000000000000000000) (bvslt (index!9101 lt!138375) (size!6926 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325)))))) (or (is-Undefined!1732 lt!138375) (ite (is-Found!1732 lt!138375) (= (select (arr!6574 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325))) (index!9099 lt!138375)) k!2581) (ite (is-MissingZero!1732 lt!138375) (= (select (arr!6574 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325))) (index!9098 lt!138375)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1732 lt!138375) (= (select (arr!6574 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325))) (index!9101 lt!138375)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64891 (= lt!138375 e!177611)))

(declare-fun c!45813 () Bool)

(assert (=> d!64891 (= c!45813 (and (is-Intermediate!1732 lt!138374) (undefined!2544 lt!138374)))))

(assert (=> d!64891 (= lt!138374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325)) mask!3868))))

(assert (=> d!64891 (validMask!0 mask!3868)))

(assert (=> d!64891 (= (seekEntryOrOpen!0 k!2581 (array!13850 (store (arr!6574 a!3325) i!1267 k!2581) (size!6926 a!3325)) mask!3868) lt!138375)))

(declare-fun b!278460 () Bool)

(assert (=> b!278460 (= e!177613 (MissingZero!1732 (index!9100 lt!138374)))))

(assert (= (and d!64891 c!45813) b!278458))

(assert (= (and d!64891 (not c!45813)) b!278457))

(assert (= (and b!278457 c!45812) b!278455))

(assert (= (and b!278457 (not c!45812)) b!278459))

(assert (= (and b!278459 c!45811) b!278460))

(assert (= (and b!278459 (not c!45811)) b!278456))

(declare-fun m!293493 () Bool)

(assert (=> b!278456 m!293493))

(declare-fun m!293495 () Bool)

(assert (=> b!278457 m!293495))

(assert (=> d!64891 m!293015))

(declare-fun m!293497 () Bool)

(assert (=> d!64891 m!293497))

(assert (=> d!64891 m!292867))

(declare-fun m!293499 () Bool)

(assert (=> d!64891 m!293499))

(assert (=> d!64891 m!293015))

(declare-fun m!293501 () Bool)

(assert (=> d!64891 m!293501))

(declare-fun m!293503 () Bool)

(assert (=> d!64891 m!293503))

(assert (=> b!278108 d!64891))

(declare-fun b!278461 () Bool)

(declare-fun e!177616 () Bool)

(declare-fun e!177617 () Bool)

(assert (=> b!278461 (= e!177616 e!177617)))

(declare-fun c!45814 () Bool)

(assert (=> b!278461 (= c!45814 (validKeyInArray!0 (select (arr!6574 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!64893 () Bool)

(declare-fun res!141938 () Bool)

(declare-fun e!177614 () Bool)

(assert (=> d!64893 (=> res!141938 e!177614)))

(assert (=> d!64893 (= res!141938 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6926 a!3325)))))

(assert (=> d!64893 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45710 (Cons!4378 (select (arr!6574 a!3325) #b00000000000000000000000000000000) Nil!4379) Nil!4379)) e!177614)))

(declare-fun b!278462 () Bool)

(assert (=> b!278462 (= e!177614 e!177616)))

(declare-fun res!141937 () Bool)

(assert (=> b!278462 (=> (not res!141937) (not e!177616))))

(declare-fun e!177615 () Bool)

(assert (=> b!278462 (= res!141937 (not e!177615))))

(declare-fun res!141939 () Bool)

(assert (=> b!278462 (=> (not res!141939) (not e!177615))))

(assert (=> b!278462 (= res!141939 (validKeyInArray!0 (select (arr!6574 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!278463 () Bool)

(declare-fun call!25385 () Bool)

(assert (=> b!278463 (= e!177617 call!25385)))

(declare-fun bm!25382 () Bool)

(assert (=> bm!25382 (= call!25385 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45814 (Cons!4378 (select (arr!6574 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!45710 (Cons!4378 (select (arr!6574 a!3325) #b00000000000000000000000000000000) Nil!4379) Nil!4379)) (ite c!45710 (Cons!4378 (select (arr!6574 a!3325) #b00000000000000000000000000000000) Nil!4379) Nil!4379))))))

(declare-fun b!278464 () Bool)

(assert (=> b!278464 (= e!177617 call!25385)))

(declare-fun b!278465 () Bool)

(assert (=> b!278465 (= e!177615 (contains!1963 (ite c!45710 (Cons!4378 (select (arr!6574 a!3325) #b00000000000000000000000000000000) Nil!4379) Nil!4379) (select (arr!6574 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!64893 (not res!141938)) b!278462))

(assert (= (and b!278462 res!141939) b!278465))

(assert (= (and b!278462 res!141937) b!278461))

(assert (= (and b!278461 c!45814) b!278463))

(assert (= (and b!278461 (not c!45814)) b!278464))

(assert (= (or b!278463 b!278464) bm!25382))

(assert (=> b!278461 m!293437))

(assert (=> b!278461 m!293437))

(declare-fun m!293505 () Bool)

(assert (=> b!278461 m!293505))

(assert (=> b!278462 m!293437))

(assert (=> b!278462 m!293437))

(assert (=> b!278462 m!293505))

(assert (=> bm!25382 m!293437))

(declare-fun m!293507 () Bool)

(assert (=> bm!25382 m!293507))

(assert (=> b!278465 m!293437))

(assert (=> b!278465 m!293437))

(declare-fun m!293509 () Bool)

(assert (=> b!278465 m!293509))

(assert (=> bm!25368 d!64893))

(declare-fun b!278466 () Bool)

(declare-fun e!177619 () SeekEntryResult!1732)

(assert (=> b!278466 (= e!177619 (Found!1732 (index!9100 lt!138209)))))

(declare-fun b!278468 () Bool)

(declare-fun c!45816 () Bool)

(declare-fun lt!138377 () (_ BitVec 64))

(assert (=> b!278468 (= c!45816 (= lt!138377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177618 () SeekEntryResult!1732)

(assert (=> b!278468 (= e!177619 e!177618)))

(declare-fun b!278469 () Bool)

(assert (=> b!278469 (= e!177618 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27337 lt!138209) #b00000000000000000000000000000001) (nextIndex!0 (index!9100 lt!138209) (x!27337 lt!138209) mask!3868) (index!9100 lt!138209) k!2581 lt!138145 mask!3868))))

(declare-fun b!278470 () Bool)

(assert (=> b!278470 (= e!177618 (MissingVacant!1732 (index!9100 lt!138209)))))

(declare-fun b!278471 () Bool)

(declare-fun e!177620 () SeekEntryResult!1732)

(assert (=> b!278471 (= e!177620 Undefined!1732)))

(declare-fun b!278467 () Bool)

(assert (=> b!278467 (= e!177620 e!177619)))

(declare-fun c!45817 () Bool)

(assert (=> b!278467 (= c!45817 (= lt!138377 k!2581))))

(declare-fun lt!138378 () SeekEntryResult!1732)

(declare-fun d!64895 () Bool)

(assert (=> d!64895 (and (or (is-Undefined!1732 lt!138378) (not (is-Found!1732 lt!138378)) (and (bvsge (index!9099 lt!138378) #b00000000000000000000000000000000) (bvslt (index!9099 lt!138378) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138378) (is-Found!1732 lt!138378) (not (is-MissingVacant!1732 lt!138378)) (not (= (index!9101 lt!138378) (index!9100 lt!138209))) (and (bvsge (index!9101 lt!138378) #b00000000000000000000000000000000) (bvslt (index!9101 lt!138378) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138378) (ite (is-Found!1732 lt!138378) (= (select (arr!6574 lt!138145) (index!9099 lt!138378)) k!2581) (and (is-MissingVacant!1732 lt!138378) (= (index!9101 lt!138378) (index!9100 lt!138209)) (= (select (arr!6574 lt!138145) (index!9101 lt!138378)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!64895 (= lt!138378 e!177620)))

(declare-fun c!45815 () Bool)

(assert (=> d!64895 (= c!45815 (bvsge (x!27337 lt!138209) #b01111111111111111111111111111110))))

(assert (=> d!64895 (= lt!138377 (select (arr!6574 lt!138145) (index!9100 lt!138209)))))

(assert (=> d!64895 (validMask!0 mask!3868)))

(assert (=> d!64895 (= (seekKeyOrZeroReturnVacant!0 (x!27337 lt!138209) (index!9100 lt!138209) (index!9100 lt!138209) k!2581 lt!138145 mask!3868) lt!138378)))

(assert (= (and d!64895 c!45815) b!278471))

(assert (= (and d!64895 (not c!45815)) b!278467))

(assert (= (and b!278467 c!45817) b!278466))

(assert (= (and b!278467 (not c!45817)) b!278468))

(assert (= (and b!278468 c!45816) b!278470))

(assert (= (and b!278468 (not c!45816)) b!278469))

(declare-fun m!293511 () Bool)

(assert (=> b!278469 m!293511))

(assert (=> b!278469 m!293511))

(declare-fun m!293513 () Bool)

(assert (=> b!278469 m!293513))

(declare-fun m!293515 () Bool)

(assert (=> d!64895 m!293515))

(declare-fun m!293517 () Bool)

(assert (=> d!64895 m!293517))

(assert (=> d!64895 m!293013))

(assert (=> d!64895 m!292867))

(assert (=> b!278095 d!64895))

(declare-fun b!278490 () Bool)

(declare-fun lt!138383 () SeekEntryResult!1732)

(assert (=> b!278490 (and (bvsge (index!9100 lt!138383) #b00000000000000000000000000000000) (bvslt (index!9100 lt!138383) (size!6926 a!3325)))))

(declare-fun res!141948 () Bool)

(assert (=> b!278490 (= res!141948 (= (select (arr!6574 a!3325) (index!9100 lt!138383)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177632 () Bool)

(assert (=> b!278490 (=> res!141948 e!177632)))

(declare-fun b!278491 () Bool)

(assert (=> b!278491 (and (bvsge (index!9100 lt!138383) #b00000000000000000000000000000000) (bvslt (index!9100 lt!138383) (size!6926 a!3325)))))

(assert (=> b!278491 (= e!177632 (= (select (arr!6574 a!3325) (index!9100 lt!138383)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!278492 () Bool)

(declare-fun e!177631 () Bool)

(declare-fun e!177635 () Bool)

(assert (=> b!278492 (= e!177631 e!177635)))

(declare-fun res!141947 () Bool)

(assert (=> b!278492 (= res!141947 (and (is-Intermediate!1732 lt!138383) (not (undefined!2544 lt!138383)) (bvslt (x!27337 lt!138383) #b01111111111111111111111111111110) (bvsge (x!27337 lt!138383) #b00000000000000000000000000000000) (bvsge (x!27337 lt!138383) #b00000000000000000000000000000000)))))

(assert (=> b!278492 (=> (not res!141947) (not e!177635))))

(declare-fun b!278493 () Bool)

(declare-fun e!177634 () SeekEntryResult!1732)

(assert (=> b!278493 (= e!177634 (Intermediate!1732 true (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!278494 () Bool)

(assert (=> b!278494 (= e!177631 (bvsge (x!27337 lt!138383) #b01111111111111111111111111111110))))

(declare-fun b!278495 () Bool)

(declare-fun e!177633 () SeekEntryResult!1732)

(assert (=> b!278495 (= e!177633 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000 mask!3868) k!2581 a!3325 mask!3868))))

(declare-fun b!278496 () Bool)

(assert (=> b!278496 (= e!177634 e!177633)))

(declare-fun c!45825 () Bool)

(declare-fun lt!138384 () (_ BitVec 64))

(assert (=> b!278496 (= c!45825 (or (= lt!138384 k!2581) (= (bvadd lt!138384 lt!138384) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!64897 () Bool)

(assert (=> d!64897 e!177631))

(declare-fun c!45826 () Bool)

(assert (=> d!64897 (= c!45826 (and (is-Intermediate!1732 lt!138383) (undefined!2544 lt!138383)))))

(assert (=> d!64897 (= lt!138383 e!177634)))

(declare-fun c!45824 () Bool)

(assert (=> d!64897 (= c!45824 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!64897 (= lt!138384 (select (arr!6574 a!3325) (toIndex!0 k!2581 mask!3868)))))

(assert (=> d!64897 (validMask!0 mask!3868)))

(assert (=> d!64897 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868) lt!138383)))

(declare-fun b!278497 () Bool)

(assert (=> b!278497 (and (bvsge (index!9100 lt!138383) #b00000000000000000000000000000000) (bvslt (index!9100 lt!138383) (size!6926 a!3325)))))

(declare-fun res!141946 () Bool)

(assert (=> b!278497 (= res!141946 (= (select (arr!6574 a!3325) (index!9100 lt!138383)) k!2581))))

(assert (=> b!278497 (=> res!141946 e!177632)))

(assert (=> b!278497 (= e!177635 e!177632)))

(declare-fun b!278498 () Bool)

(assert (=> b!278498 (= e!177633 (Intermediate!1732 false (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000))))

(assert (= (and d!64897 c!45824) b!278493))

(assert (= (and d!64897 (not c!45824)) b!278496))

(assert (= (and b!278496 c!45825) b!278498))

(assert (= (and b!278496 (not c!45825)) b!278495))

(assert (= (and d!64897 c!45826) b!278494))

(assert (= (and d!64897 (not c!45826)) b!278492))

(assert (= (and b!278492 res!141947) b!278497))

(assert (= (and b!278497 (not res!141946)) b!278490))

(assert (= (and b!278490 (not res!141948)) b!278491))

(assert (=> d!64897 m!293015))

(declare-fun m!293519 () Bool)

(assert (=> d!64897 m!293519))

(assert (=> d!64897 m!292867))

(declare-fun m!293521 () Bool)

(assert (=> b!278497 m!293521))

(assert (=> b!278490 m!293521))

(assert (=> b!278491 m!293521))

(assert (=> b!278495 m!293015))

(declare-fun m!293523 () Bool)

(assert (=> b!278495 m!293523))

(assert (=> b!278495 m!293523))

(declare-fun m!293525 () Bool)

(assert (=> b!278495 m!293525))

(assert (=> d!64749 d!64897))

(declare-fun d!64899 () Bool)

(declare-fun lt!138390 () (_ BitVec 32))

(declare-fun lt!138389 () (_ BitVec 32))

(assert (=> d!64899 (= lt!138390 (bvmul (bvxor lt!138389 (bvlshr lt!138389 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!64899 (= lt!138389 ((_ extract 31 0) (bvand (bvxor k!2581 (bvlshr k!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!64899 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!141949 (let ((h!5048 ((_ extract 31 0) (bvand (bvxor k!2581 (bvlshr k!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27346 (bvmul (bvxor h!5048 (bvlshr h!5048 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27346 (bvlshr x!27346 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!141949 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!141949 #b00000000000000000000000000000000))))))

(assert (=> d!64899 (= (toIndex!0 k!2581 mask!3868) (bvand (bvxor lt!138390 (bvlshr lt!138390 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!64749 d!64899))

(assert (=> d!64749 d!64741))

(assert (=> b!278120 d!64879))

(assert (=> b!278160 d!64879))

(declare-fun d!64901 () Bool)

(assert (=> d!64901 (= (validKeyInArray!0 (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26))) (and (not (= (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278023 d!64901))

(declare-fun d!64903 () Bool)

(assert (=> d!64903 (arrayContainsKey!0 lt!138145 lt!138175 #b00000000000000000000000000000000)))

(declare-fun lt!138391 () Unit!8797)

(assert (=> d!64903 (= lt!138391 (choose!13 lt!138145 lt!138175 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> d!64903 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))

(assert (=> d!64903 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!138145 lt!138175 (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138391)))

(declare-fun bs!9924 () Bool)

(assert (= bs!9924 d!64903))

(assert (=> bs!9924 m!292925))

(declare-fun m!293527 () Bool)

(assert (=> bs!9924 m!293527))

(assert (=> b!278022 d!64903))

(declare-fun d!64905 () Bool)

(declare-fun res!141950 () Bool)

(declare-fun e!177636 () Bool)

(assert (=> d!64905 (=> res!141950 e!177636)))

(assert (=> d!64905 (= res!141950 (= (select (arr!6574 lt!138145) #b00000000000000000000000000000000) lt!138175))))

(assert (=> d!64905 (= (arrayContainsKey!0 lt!138145 lt!138175 #b00000000000000000000000000000000) e!177636)))

(declare-fun b!278499 () Bool)

(declare-fun e!177637 () Bool)

(assert (=> b!278499 (= e!177636 e!177637)))

(declare-fun res!141951 () Bool)

(assert (=> b!278499 (=> (not res!141951) (not e!177637))))

(assert (=> b!278499 (= res!141951 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6926 lt!138145)))))

(declare-fun b!278500 () Bool)

(assert (=> b!278500 (= e!177637 (arrayContainsKey!0 lt!138145 lt!138175 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64905 (not res!141950)) b!278499))

(assert (= (and b!278499 res!141951) b!278500))

(assert (=> d!64905 m!293463))

(declare-fun m!293529 () Bool)

(assert (=> b!278500 m!293529))

(assert (=> b!278022 d!64905))

(declare-fun b!278501 () Bool)

(declare-fun e!177639 () SeekEntryResult!1732)

(declare-fun lt!138392 () SeekEntryResult!1732)

(assert (=> b!278501 (= e!177639 (Found!1732 (index!9100 lt!138392)))))

(declare-fun b!278502 () Bool)

(declare-fun e!177640 () SeekEntryResult!1732)

(assert (=> b!278502 (= e!177640 (seekKeyOrZeroReturnVacant!0 (x!27337 lt!138392) (index!9100 lt!138392) (index!9100 lt!138392) (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138145 mask!3868))))

(declare-fun b!278503 () Bool)

(declare-fun e!177638 () SeekEntryResult!1732)

(assert (=> b!278503 (= e!177638 e!177639)))

(declare-fun lt!138394 () (_ BitVec 64))

(assert (=> b!278503 (= lt!138394 (select (arr!6574 lt!138145) (index!9100 lt!138392)))))

(declare-fun c!45828 () Bool)

(assert (=> b!278503 (= c!45828 (= lt!138394 (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun b!278504 () Bool)

(assert (=> b!278504 (= e!177638 Undefined!1732)))

(declare-fun b!278505 () Bool)

(declare-fun c!45827 () Bool)

(assert (=> b!278505 (= c!45827 (= lt!138394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278505 (= e!177639 e!177640)))

(declare-fun d!64907 () Bool)

(declare-fun lt!138393 () SeekEntryResult!1732)

(assert (=> d!64907 (and (or (is-Undefined!1732 lt!138393) (not (is-Found!1732 lt!138393)) (and (bvsge (index!9099 lt!138393) #b00000000000000000000000000000000) (bvslt (index!9099 lt!138393) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138393) (is-Found!1732 lt!138393) (not (is-MissingZero!1732 lt!138393)) (and (bvsge (index!9098 lt!138393) #b00000000000000000000000000000000) (bvslt (index!9098 lt!138393) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138393) (is-Found!1732 lt!138393) (is-MissingZero!1732 lt!138393) (not (is-MissingVacant!1732 lt!138393)) (and (bvsge (index!9101 lt!138393) #b00000000000000000000000000000000) (bvslt (index!9101 lt!138393) (size!6926 lt!138145)))) (or (is-Undefined!1732 lt!138393) (ite (is-Found!1732 lt!138393) (= (select (arr!6574 lt!138145) (index!9099 lt!138393)) (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26))) (ite (is-MissingZero!1732 lt!138393) (= (select (arr!6574 lt!138145) (index!9098 lt!138393)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1732 lt!138393) (= (select (arr!6574 lt!138145) (index!9101 lt!138393)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64907 (= lt!138393 e!177638)))

(declare-fun c!45829 () Bool)

(assert (=> d!64907 (= c!45829 (and (is-Intermediate!1732 lt!138392) (undefined!2544 lt!138392)))))

(assert (=> d!64907 (= lt!138392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26)) mask!3868) (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138145 mask!3868))))

(assert (=> d!64907 (validMask!0 mask!3868)))

(assert (=> d!64907 (= (seekEntryOrOpen!0 (select (arr!6574 lt!138145) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!138145 mask!3868) lt!138393)))

(declare-fun b!278506 () Bool)

(assert (=> b!278506 (= e!177640 (MissingZero!1732 (index!9100 lt!138392)))))

(assert (= (and d!64907 c!45829) b!278504))

(assert (= (and d!64907 (not c!45829)) b!278503))

(assert (= (and b!278503 c!45828) b!278501))

(assert (= (and b!278503 (not c!45828)) b!278505))

(assert (= (and b!278505 c!45827) b!278506))

(assert (= (and b!278505 (not c!45827)) b!278502))

(assert (=> b!278502 m!292921))

(declare-fun m!293531 () Bool)

(assert (=> b!278502 m!293531))

(declare-fun m!293533 () Bool)

(assert (=> b!278503 m!293533))

(declare-fun m!293535 () Bool)

(assert (=> d!64907 m!293535))

(assert (=> d!64907 m!292921))

(declare-fun m!293537 () Bool)

(assert (=> d!64907 m!293537))

(assert (=> d!64907 m!292867))

(declare-fun m!293539 () Bool)

(assert (=> d!64907 m!293539))

(assert (=> d!64907 m!292921))

(assert (=> d!64907 m!293535))

(declare-fun m!293541 () Bool)

(assert (=> d!64907 m!293541))

(declare-fun m!293543 () Bool)

(assert (=> d!64907 m!293543))

(assert (=> b!278022 d!64907))

(declare-fun d!64909 () Bool)

(assert (=> d!64909 (arrayContainsKey!0 a!3325 lt!138223 #b00000000000000000000000000000000)))

(declare-fun lt!138395 () Unit!8797)

(assert (=> d!64909 (= lt!138395 (choose!13 a!3325 lt!138223 #b00000000000000000000000000000000))))

(assert (=> d!64909 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

