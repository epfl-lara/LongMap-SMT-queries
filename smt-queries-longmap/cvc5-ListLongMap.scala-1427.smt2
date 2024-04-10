; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27588 () Bool)

(assert start!27588)

(declare-fun b!285077 () Bool)

(declare-fun res!147591 () Bool)

(declare-fun e!180717 () Bool)

(assert (=> b!285077 (=> (not res!147591) (not e!180717))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14238 0))(
  ( (array!14239 (arr!6758 (Array (_ BitVec 32) (_ BitVec 64))) (size!7110 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14238)

(assert (=> b!285077 (= res!147591 (and (bvslt startIndex!26 (bvsub (size!7110 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!285078 () Bool)

(declare-fun e!180719 () Bool)

(declare-fun e!180716 () Bool)

(assert (=> b!285078 (= e!180719 e!180716)))

(declare-fun res!147585 () Bool)

(assert (=> b!285078 (=> (not res!147585) (not e!180716))))

(declare-datatypes ((SeekEntryResult!1916 0))(
  ( (MissingZero!1916 (index!9834 (_ BitVec 32))) (Found!1916 (index!9835 (_ BitVec 32))) (Intermediate!1916 (undefined!2728 Bool) (index!9836 (_ BitVec 32)) (x!28035 (_ BitVec 32))) (Undefined!1916) (MissingVacant!1916 (index!9837 (_ BitVec 32))) )
))
(declare-fun lt!140685 () SeekEntryResult!1916)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!285078 (= res!147585 (or (= lt!140685 (MissingZero!1916 i!1267)) (= lt!140685 (MissingVacant!1916 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14238 (_ BitVec 32)) SeekEntryResult!1916)

(assert (=> b!285078 (= lt!140685 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!285079 () Bool)

(declare-fun res!147592 () Bool)

(assert (=> b!285079 (=> (not res!147592) (not e!180719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285079 (= res!147592 (validKeyInArray!0 k!2581))))

(declare-fun b!285080 () Bool)

(declare-fun res!147594 () Bool)

(assert (=> b!285080 (=> (not res!147594) (not e!180717))))

(assert (=> b!285080 (= res!147594 (not (validKeyInArray!0 (select (arr!6758 a!3325) startIndex!26))))))

(declare-fun b!285081 () Bool)

(declare-fun res!147589 () Bool)

(assert (=> b!285081 (=> (not res!147589) (not e!180719))))

(declare-datatypes ((List!4566 0))(
  ( (Nil!4563) (Cons!4562 (h!5235 (_ BitVec 64)) (t!9648 List!4566)) )
))
(declare-fun arrayNoDuplicates!0 (array!14238 (_ BitVec 32) List!4566) Bool)

(assert (=> b!285081 (= res!147589 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4563))))

(declare-fun b!285082 () Bool)

(declare-fun res!147588 () Bool)

(assert (=> b!285082 (=> (not res!147588) (not e!180719))))

(declare-fun arrayContainsKey!0 (array!14238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285082 (= res!147588 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285083 () Bool)

(assert (=> b!285083 (= e!180716 e!180717)))

(declare-fun res!147586 () Bool)

(assert (=> b!285083 (=> (not res!147586) (not e!180717))))

(assert (=> b!285083 (= res!147586 (not (= startIndex!26 i!1267)))))

(declare-fun lt!140686 () array!14238)

(assert (=> b!285083 (= lt!140686 (array!14239 (store (arr!6758 a!3325) i!1267 k!2581) (size!7110 a!3325)))))

(declare-fun b!285084 () Bool)

(declare-fun res!147593 () Bool)

(assert (=> b!285084 (=> (not res!147593) (not e!180719))))

(assert (=> b!285084 (= res!147593 (and (= (size!7110 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7110 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7110 a!3325))))))

(declare-fun b!285085 () Bool)

(declare-fun res!147590 () Bool)

(assert (=> b!285085 (=> (not res!147590) (not e!180716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14238 (_ BitVec 32)) Bool)

(assert (=> b!285085 (= res!147590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!147587 () Bool)

(assert (=> start!27588 (=> (not res!147587) (not e!180719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27588 (= res!147587 (validMask!0 mask!3868))))

(assert (=> start!27588 e!180719))

(declare-fun array_inv!4721 (array!14238) Bool)

(assert (=> start!27588 (array_inv!4721 a!3325)))

(assert (=> start!27588 true))

(declare-fun b!285086 () Bool)

(assert (=> b!285086 (= e!180717 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140686 mask!3868)))))

(assert (=> b!285086 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!140686 mask!3868)))

(declare-datatypes ((Unit!9038 0))(
  ( (Unit!9039) )
))
(declare-fun lt!140684 () Unit!9038)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9038)

(assert (=> b!285086 (= lt!140684 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (= (and start!27588 res!147587) b!285084))

(assert (= (and b!285084 res!147593) b!285079))

(assert (= (and b!285079 res!147592) b!285081))

(assert (= (and b!285081 res!147589) b!285082))

(assert (= (and b!285082 res!147588) b!285078))

(assert (= (and b!285078 res!147585) b!285085))

(assert (= (and b!285085 res!147590) b!285083))

(assert (= (and b!285083 res!147586) b!285080))

(assert (= (and b!285080 res!147594) b!285077))

(assert (= (and b!285077 res!147591) b!285086))

(declare-fun m!299937 () Bool)

(assert (=> b!285080 m!299937))

(assert (=> b!285080 m!299937))

(declare-fun m!299939 () Bool)

(assert (=> b!285080 m!299939))

(declare-fun m!299941 () Bool)

(assert (=> b!285085 m!299941))

(declare-fun m!299943 () Bool)

(assert (=> b!285083 m!299943))

(declare-fun m!299945 () Bool)

(assert (=> b!285079 m!299945))

(declare-fun m!299947 () Bool)

(assert (=> b!285082 m!299947))

(declare-fun m!299949 () Bool)

(assert (=> b!285086 m!299949))

(declare-fun m!299951 () Bool)

(assert (=> b!285086 m!299951))

(declare-fun m!299953 () Bool)

(assert (=> b!285086 m!299953))

(declare-fun m!299955 () Bool)

(assert (=> b!285078 m!299955))

(declare-fun m!299957 () Bool)

(assert (=> b!285081 m!299957))

(declare-fun m!299959 () Bool)

(assert (=> start!27588 m!299959))

(declare-fun m!299961 () Bool)

(assert (=> start!27588 m!299961))

(push 1)

(assert (not b!285086))

(assert (not start!27588))

(assert (not b!285082))

(assert (not b!285078))

(assert (not b!285085))

(assert (not b!285081))

(assert (not b!285080))

(assert (not b!285079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!285167 () Bool)

(declare-fun e!180760 () Bool)

(declare-fun call!25540 () Bool)

(assert (=> b!285167 (= e!180760 call!25540)))

(declare-fun bm!25537 () Bool)

(assert (=> bm!25537 (= call!25540 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!285168 () Bool)

(declare-fun e!180761 () Bool)

(assert (=> b!285168 (= e!180761 call!25540)))

(declare-fun d!65699 () Bool)

(declare-fun res!147666 () Bool)

(declare-fun e!180759 () Bool)

(assert (=> d!65699 (=> res!147666 e!180759)))

(assert (=> d!65699 (= res!147666 (bvsge #b00000000000000000000000000000000 (size!7110 a!3325)))))

(assert (=> d!65699 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!180759)))

(declare-fun b!285169 () Bool)

(assert (=> b!285169 (= e!180759 e!180761)))

(declare-fun c!46305 () Bool)

(assert (=> b!285169 (= c!46305 (validKeyInArray!0 (select (arr!6758 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285170 () Bool)

(assert (=> b!285170 (= e!180761 e!180760)))

(declare-fun lt!140722 () (_ BitVec 64))

(assert (=> b!285170 (= lt!140722 (select (arr!6758 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140721 () Unit!9038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14238 (_ BitVec 64) (_ BitVec 32)) Unit!9038)

(assert (=> b!285170 (= lt!140721 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140722 #b00000000000000000000000000000000))))

(assert (=> b!285170 (arrayContainsKey!0 a!3325 lt!140722 #b00000000000000000000000000000000)))

(declare-fun lt!140720 () Unit!9038)

(assert (=> b!285170 (= lt!140720 lt!140721)))

(declare-fun res!147665 () Bool)

(assert (=> b!285170 (= res!147665 (= (seekEntryOrOpen!0 (select (arr!6758 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1916 #b00000000000000000000000000000000)))))

(assert (=> b!285170 (=> (not res!147665) (not e!180760))))

(assert (= (and d!65699 (not res!147666)) b!285169))

(assert (= (and b!285169 c!46305) b!285170))

(assert (= (and b!285169 (not c!46305)) b!285168))

(assert (= (and b!285170 res!147665) b!285167))

(assert (= (or b!285167 b!285168) bm!25537))

(declare-fun m!300017 () Bool)

(assert (=> bm!25537 m!300017))

(declare-fun m!300021 () Bool)

(assert (=> b!285169 m!300021))

(assert (=> b!285169 m!300021))

(declare-fun m!300025 () Bool)

(assert (=> b!285169 m!300025))

(assert (=> b!285170 m!300021))

(declare-fun m!300031 () Bool)

(assert (=> b!285170 m!300031))

(declare-fun m!300033 () Bool)

(assert (=> b!285170 m!300033))

(assert (=> b!285170 m!300021))

(declare-fun m!300037 () Bool)

(assert (=> b!285170 m!300037))

(assert (=> b!285085 d!65699))

(declare-fun d!65707 () Bool)

(assert (=> d!65707 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27588 d!65707))

(declare-fun d!65717 () Bool)

(assert (=> d!65717 (= (array_inv!4721 a!3325) (bvsge (size!7110 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27588 d!65717))

(declare-fun d!65719 () Bool)

(assert (=> d!65719 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285079 d!65719))

(declare-fun b!285246 () Bool)

(declare-fun e!180816 () SeekEntryResult!1916)

(declare-fun lt!140761 () SeekEntryResult!1916)

(assert (=> b!285246 (= e!180816 (MissingZero!1916 (index!9836 lt!140761)))))

(declare-fun b!285247 () Bool)

(declare-fun c!46329 () Bool)

(declare-fun lt!140760 () (_ BitVec 64))

(assert (=> b!285247 (= c!46329 (= lt!140760 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180817 () SeekEntryResult!1916)

(assert (=> b!285247 (= e!180817 e!180816)))

(declare-fun b!285248 () Bool)

(declare-fun e!180818 () SeekEntryResult!1916)

(assert (=> b!285248 (= e!180818 e!180817)))

(assert (=> b!285248 (= lt!140760 (select (arr!6758 a!3325) (index!9836 lt!140761)))))

(declare-fun c!46327 () Bool)

(assert (=> b!285248 (= c!46327 (= lt!140760 k!2581))))

(declare-fun d!65721 () Bool)

(declare-fun lt!140759 () SeekEntryResult!1916)

(assert (=> d!65721 (and (or (is-Undefined!1916 lt!140759) (not (is-Found!1916 lt!140759)) (and (bvsge (index!9835 lt!140759) #b00000000000000000000000000000000) (bvslt (index!9835 lt!140759) (size!7110 a!3325)))) (or (is-Undefined!1916 lt!140759) (is-Found!1916 lt!140759) (not (is-MissingZero!1916 lt!140759)) (and (bvsge (index!9834 lt!140759) #b00000000000000000000000000000000) (bvslt (index!9834 lt!140759) (size!7110 a!3325)))) (or (is-Undefined!1916 lt!140759) (is-Found!1916 lt!140759) (is-MissingZero!1916 lt!140759) (not (is-MissingVacant!1916 lt!140759)) (and (bvsge (index!9837 lt!140759) #b00000000000000000000000000000000) (bvslt (index!9837 lt!140759) (size!7110 a!3325)))) (or (is-Undefined!1916 lt!140759) (ite (is-Found!1916 lt!140759) (= (select (arr!6758 a!3325) (index!9835 lt!140759)) k!2581) (ite (is-MissingZero!1916 lt!140759) (= (select (arr!6758 a!3325) (index!9834 lt!140759)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1916 lt!140759) (= (select (arr!6758 a!3325) (index!9837 lt!140759)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65721 (= lt!140759 e!180818)))

(declare-fun c!46328 () Bool)

(assert (=> d!65721 (= c!46328 (and (is-Intermediate!1916 lt!140761) (undefined!2728 lt!140761)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14238 (_ BitVec 32)) SeekEntryResult!1916)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65721 (= lt!140761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65721 (validMask!0 mask!3868)))

(assert (=> d!65721 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!140759)))

(declare-fun b!285249 () Bool)

(assert (=> b!285249 (= e!180817 (Found!1916 (index!9836 lt!140761)))))

(declare-fun b!285250 () Bool)

(assert (=> b!285250 (= e!180818 Undefined!1916)))

(declare-fun b!285251 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14238 (_ BitVec 32)) SeekEntryResult!1916)

(assert (=> b!285251 (= e!180816 (seekKeyOrZeroReturnVacant!0 (x!28035 lt!140761) (index!9836 lt!140761) (index!9836 lt!140761) k!2581 a!3325 mask!3868))))

(assert (= (and d!65721 c!46328) b!285250))

(assert (= (and d!65721 (not c!46328)) b!285248))

(assert (= (and b!285248 c!46327) b!285249))

(assert (= (and b!285248 (not c!46327)) b!285247))

(assert (= (and b!285247 c!46329) b!285246))

(assert (= (and b!285247 (not c!46329)) b!285251))

(declare-fun m!300105 () Bool)

(assert (=> b!285248 m!300105))

(declare-fun m!300107 () Bool)

(assert (=> d!65721 m!300107))

(declare-fun m!300109 () Bool)

(assert (=> d!65721 m!300109))

(declare-fun m!300111 () Bool)

(assert (=> d!65721 m!300111))

(declare-fun m!300113 () Bool)

(assert (=> d!65721 m!300113))

(assert (=> d!65721 m!300109))

(declare-fun m!300115 () Bool)

(assert (=> d!65721 m!300115))

(assert (=> d!65721 m!299959))

(declare-fun m!300117 () Bool)

(assert (=> b!285251 m!300117))

(assert (=> b!285078 d!65721))

(declare-fun d!65739 () Bool)

(declare-fun res!147704 () Bool)

(declare-fun e!180826 () Bool)

(assert (=> d!65739 (=> res!147704 e!180826)))

(assert (=> d!65739 (= res!147704 (= (select (arr!6758 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65739 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!180826)))

(declare-fun b!285262 () Bool)

(declare-fun e!180827 () Bool)

(assert (=> b!285262 (= e!180826 e!180827)))

(declare-fun res!147705 () Bool)

(assert (=> b!285262 (=> (not res!147705) (not e!180827))))

(assert (=> b!285262 (= res!147705 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7110 a!3325)))))

(declare-fun b!285263 () Bool)

(assert (=> b!285263 (= e!180827 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65739 (not res!147704)) b!285262))

(assert (= (and b!285262 res!147705) b!285263))

(assert (=> d!65739 m!300021))

(declare-fun m!300119 () Bool)

(assert (=> b!285263 m!300119))

(assert (=> b!285082 d!65739))

(declare-fun b!285264 () Bool)

(declare-fun e!180829 () Bool)

(declare-fun call!25550 () Bool)

(assert (=> b!285264 (= e!180829 call!25550)))

(declare-fun bm!25547 () Bool)

(assert (=> bm!25547 (= call!25550 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140686 mask!3868))))

(declare-fun b!285265 () Bool)

(declare-fun e!180830 () Bool)

(assert (=> b!285265 (= e!180830 call!25550)))

(declare-fun d!65741 () Bool)

(declare-fun res!147707 () Bool)

(declare-fun e!180828 () Bool)

(assert (=> d!65741 (=> res!147707 e!180828)))

(assert (=> d!65741 (= res!147707 (bvsge startIndex!26 (size!7110 lt!140686)))))

(assert (=> d!65741 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140686 mask!3868) e!180828)))

(declare-fun b!285266 () Bool)

(assert (=> b!285266 (= e!180828 e!180830)))

(declare-fun c!46333 () Bool)

(assert (=> b!285266 (= c!46333 (validKeyInArray!0 (select (arr!6758 lt!140686) startIndex!26)))))

(declare-fun b!285267 () Bool)

(assert (=> b!285267 (= e!180830 e!180829)))

(declare-fun lt!140767 () (_ BitVec 64))

(assert (=> b!285267 (= lt!140767 (select (arr!6758 lt!140686) startIndex!26))))

(declare-fun lt!140766 () Unit!9038)

(assert (=> b!285267 (= lt!140766 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140686 lt!140767 startIndex!26))))

(assert (=> b!285267 (arrayContainsKey!0 lt!140686 lt!140767 #b00000000000000000000000000000000)))

(declare-fun lt!140765 () Unit!9038)

(assert (=> b!285267 (= lt!140765 lt!140766)))

(declare-fun res!147706 () Bool)

(assert (=> b!285267 (= res!147706 (= (seekEntryOrOpen!0 (select (arr!6758 lt!140686) startIndex!26) lt!140686 mask!3868) (Found!1916 startIndex!26)))))

(assert (=> b!285267 (=> (not res!147706) (not e!180829))))

(assert (= (and d!65741 (not res!147707)) b!285266))

(assert (= (and b!285266 c!46333) b!285267))

(assert (= (and b!285266 (not c!46333)) b!285265))

(assert (= (and b!285267 res!147706) b!285264))

(assert (= (or b!285264 b!285265) bm!25547))

(declare-fun m!300135 () Bool)

(assert (=> bm!25547 m!300135))

(declare-fun m!300137 () Bool)

(assert (=> b!285266 m!300137))

(assert (=> b!285266 m!300137))

(declare-fun m!300139 () Bool)

(assert (=> b!285266 m!300139))

(assert (=> b!285267 m!300137))

(declare-fun m!300141 () Bool)

(assert (=> b!285267 m!300141))

(declare-fun m!300143 () Bool)

(assert (=> b!285267 m!300143))

(assert (=> b!285267 m!300137))

(declare-fun m!300145 () Bool)

(assert (=> b!285267 m!300145))

(assert (=> b!285086 d!65741))

(declare-fun b!285268 () Bool)

(declare-fun e!180832 () Bool)

(declare-fun call!25551 () Bool)

(assert (=> b!285268 (= e!180832 call!25551)))

(declare-fun bm!25548 () Bool)

(assert (=> bm!25548 (= call!25551 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!140686 mask!3868))))

(declare-fun b!285269 () Bool)

(declare-fun e!180833 () Bool)

(assert (=> b!285269 (= e!180833 call!25551)))

(declare-fun d!65745 () Bool)

(declare-fun res!147709 () Bool)

(declare-fun e!180831 () Bool)

(assert (=> d!65745 (=> res!147709 e!180831)))

(assert (=> d!65745 (= res!147709 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!7110 lt!140686)))))

(assert (=> d!65745 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!140686 mask!3868) e!180831)))

(declare-fun b!285270 () Bool)

(assert (=> b!285270 (= e!180831 e!180833)))

(declare-fun c!46334 () Bool)

(assert (=> b!285270 (= c!46334 (validKeyInArray!0 (select (arr!6758 lt!140686) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun b!285271 () Bool)

(assert (=> b!285271 (= e!180833 e!180832)))

(declare-fun lt!140770 () (_ BitVec 64))

(assert (=> b!285271 (= lt!140770 (select (arr!6758 lt!140686) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!140769 () Unit!9038)

(assert (=> b!285271 (= lt!140769 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140686 lt!140770 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!285271 (arrayContainsKey!0 lt!140686 lt!140770 #b00000000000000000000000000000000)))

(declare-fun lt!140768 () Unit!9038)

(assert (=> b!285271 (= lt!140768 lt!140769)))

(declare-fun res!147708 () Bool)

(assert (=> b!285271 (= res!147708 (= (seekEntryOrOpen!0 (select (arr!6758 lt!140686) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!140686 mask!3868) (Found!1916 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!285271 (=> (not res!147708) (not e!180832))))

(assert (= (and d!65745 (not res!147709)) b!285270))

(assert (= (and b!285270 c!46334) b!285271))

(assert (= (and b!285270 (not c!46334)) b!285269))

(assert (= (and b!285271 res!147708) b!285268))

(assert (= (or b!285268 b!285269) bm!25548))

(declare-fun m!300147 () Bool)

(assert (=> bm!25548 m!300147))

(declare-fun m!300149 () Bool)

(assert (=> b!285270 m!300149))

(assert (=> b!285270 m!300149))

(declare-fun m!300151 () Bool)

(assert (=> b!285270 m!300151))

(assert (=> b!285271 m!300149))

(declare-fun m!300153 () Bool)

(assert (=> b!285271 m!300153))

(declare-fun m!300155 () Bool)

(assert (=> b!285271 m!300155))

(assert (=> b!285271 m!300149))

(declare-fun m!300157 () Bool)

(assert (=> b!285271 m!300157))

(assert (=> b!285086 d!65745))

(declare-fun d!65747 () Bool)

(declare-fun e!180845 () Bool)

(assert (=> d!65747 e!180845))

(declare-fun res!147720 () Bool)

(assert (=> d!65747 (=> (not res!147720) (not e!180845))))

(assert (=> d!65747 (= res!147720 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7110 a!3325))))))

(declare-fun lt!140776 () Unit!9038)

(declare-fun choose!98 (array!14238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9038)

(assert (=> d!65747 (= lt!140776 (choose!98 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!65747 (validMask!0 mask!3868)))

(assert (=> d!65747 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!140776)))

(declare-fun b!285284 () Bool)

(assert (=> b!285284 (= e!180845 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14239 (store (arr!6758 a!3325) i!1267 k!2581) (size!7110 a!3325)) mask!3868))))

(assert (= (and d!65747 res!147720) b!285284))

(declare-fun m!300169 () Bool)

(assert (=> d!65747 m!300169))

(assert (=> d!65747 m!299959))

(assert (=> b!285284 m!299943))

(declare-fun m!300171 () Bool)

(assert (=> b!285284 m!300171))

(assert (=> b!285086 d!65747))

(declare-fun d!65751 () Bool)

(declare-fun res!147729 () Bool)

(declare-fun e!180866 () Bool)

(assert (=> d!65751 (=> res!147729 e!180866)))

(assert (=> d!65751 (= res!147729 (bvsge #b00000000000000000000000000000000 (size!7110 a!3325)))))

(assert (=> d!65751 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4563) e!180866)))

(declare-fun b!285313 () Bool)

