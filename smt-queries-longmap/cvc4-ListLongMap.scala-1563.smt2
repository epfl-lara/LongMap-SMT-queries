; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29774 () Bool)

(assert start!29774)

(declare-fun b!299907 () Bool)

(declare-fun res!158081 () Bool)

(declare-fun e!189408 () Bool)

(assert (=> b!299907 (=> (not res!158081) (not e!189408))))

(declare-datatypes ((array!15142 0))(
  ( (array!15143 (arr!7168 (Array (_ BitVec 32) (_ BitVec 64))) (size!7520 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15142)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15142 (_ BitVec 32)) Bool)

(assert (=> b!299907 (= res!158081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299909 () Bool)

(declare-fun e!189407 () Bool)

(assert (=> b!299909 (= e!189407 e!189408)))

(declare-fun res!158085 () Bool)

(assert (=> b!299909 (=> (not res!158085) (not e!189408))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!149168 () Bool)

(declare-datatypes ((SeekEntryResult!2317 0))(
  ( (MissingZero!2317 (index!11444 (_ BitVec 32))) (Found!2317 (index!11445 (_ BitVec 32))) (Intermediate!2317 (undefined!3129 Bool) (index!11446 (_ BitVec 32)) (x!29691 (_ BitVec 32))) (Undefined!2317) (MissingVacant!2317 (index!11447 (_ BitVec 32))) )
))
(declare-fun lt!149169 () SeekEntryResult!2317)

(assert (=> b!299909 (= res!158085 (or lt!149168 (= lt!149169 (MissingVacant!2317 i!1256))))))

(assert (=> b!299909 (= lt!149168 (= lt!149169 (MissingZero!2317 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15142 (_ BitVec 32)) SeekEntryResult!2317)

(assert (=> b!299909 (= lt!149169 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!299910 () Bool)

(declare-fun res!158080 () Bool)

(assert (=> b!299910 (=> (not res!158080) (not e!189407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299910 (= res!158080 (validKeyInArray!0 k!2524))))

(declare-fun b!299911 () Bool)

(declare-fun res!158084 () Bool)

(assert (=> b!299911 (=> (not res!158084) (not e!189407))))

(assert (=> b!299911 (= res!158084 (and (= (size!7520 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7520 a!3312))))))

(declare-fun b!299912 () Bool)

(declare-fun lt!149167 () SeekEntryResult!2317)

(assert (=> b!299912 (= e!189408 (and (not lt!149168) (= lt!149169 (MissingVacant!2317 i!1256)) (let ((bdg!6452 (not (is-Intermediate!2317 lt!149167)))) (and (or bdg!6452 (not (undefined!3129 lt!149167))) (or bdg!6452 (not (= (select (arr!7168 a!3312) (index!11446 lt!149167)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6452) (= (select (arr!7168 a!3312) (index!11446 lt!149167)) k!2524)))))))

(declare-fun lt!149165 () SeekEntryResult!2317)

(declare-fun lt!149166 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15142 (_ BitVec 32)) SeekEntryResult!2317)

(assert (=> b!299912 (= lt!149165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149166 k!2524 (array!15143 (store (arr!7168 a!3312) i!1256 k!2524) (size!7520 a!3312)) mask!3809))))

(assert (=> b!299912 (= lt!149167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149166 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299912 (= lt!149166 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!158082 () Bool)

(assert (=> start!29774 (=> (not res!158082) (not e!189407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29774 (= res!158082 (validMask!0 mask!3809))))

(assert (=> start!29774 e!189407))

(assert (=> start!29774 true))

(declare-fun array_inv!5131 (array!15142) Bool)

(assert (=> start!29774 (array_inv!5131 a!3312)))

(declare-fun b!299908 () Bool)

(declare-fun res!158083 () Bool)

(assert (=> b!299908 (=> (not res!158083) (not e!189407))))

(declare-fun arrayContainsKey!0 (array!15142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299908 (= res!158083 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29774 res!158082) b!299911))

(assert (= (and b!299911 res!158084) b!299910))

(assert (= (and b!299910 res!158080) b!299908))

(assert (= (and b!299908 res!158083) b!299909))

(assert (= (and b!299909 res!158085) b!299907))

(assert (= (and b!299907 res!158081) b!299912))

(declare-fun m!312041 () Bool)

(assert (=> b!299908 m!312041))

(declare-fun m!312043 () Bool)

(assert (=> b!299907 m!312043))

(declare-fun m!312045 () Bool)

(assert (=> b!299910 m!312045))

(declare-fun m!312047 () Bool)

(assert (=> start!29774 m!312047))

(declare-fun m!312049 () Bool)

(assert (=> start!29774 m!312049))

(declare-fun m!312051 () Bool)

(assert (=> b!299909 m!312051))

(declare-fun m!312053 () Bool)

(assert (=> b!299912 m!312053))

(declare-fun m!312055 () Bool)

(assert (=> b!299912 m!312055))

(declare-fun m!312057 () Bool)

(assert (=> b!299912 m!312057))

(declare-fun m!312059 () Bool)

(assert (=> b!299912 m!312059))

(declare-fun m!312061 () Bool)

(assert (=> b!299912 m!312061))

(push 1)

(assert (not b!299907))

(assert (not b!299910))

(assert (not b!299908))

(assert (not start!29774))

(assert (not b!299912))

(assert (not b!299909))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!299949 () Bool)

(declare-fun e!189435 () SeekEntryResult!2317)

(assert (=> b!299949 (= e!189435 (Intermediate!2317 false lt!149166 #b00000000000000000000000000000000))))

(declare-fun b!299950 () Bool)

(declare-fun lt!149183 () SeekEntryResult!2317)

(assert (=> b!299950 (and (bvsge (index!11446 lt!149183) #b00000000000000000000000000000000) (bvslt (index!11446 lt!149183) (size!7520 (array!15143 (store (arr!7168 a!3312) i!1256 k!2524) (size!7520 a!3312)))))))

(declare-fun res!158106 () Bool)

(assert (=> b!299950 (= res!158106 (= (select (arr!7168 (array!15143 (store (arr!7168 a!3312) i!1256 k!2524) (size!7520 a!3312))) (index!11446 lt!149183)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189437 () Bool)

(assert (=> b!299950 (=> res!158106 e!189437)))

(declare-fun b!299951 () Bool)

(declare-fun e!189439 () Bool)

(assert (=> b!299951 (= e!189439 (bvsge (x!29691 lt!149183) #b01111111111111111111111111111110))))

(declare-fun b!299952 () Bool)

(assert (=> b!299952 (and (bvsge (index!11446 lt!149183) #b00000000000000000000000000000000) (bvslt (index!11446 lt!149183) (size!7520 (array!15143 (store (arr!7168 a!3312) i!1256 k!2524) (size!7520 a!3312)))))))

(assert (=> b!299952 (= e!189437 (= (select (arr!7168 (array!15143 (store (arr!7168 a!3312) i!1256 k!2524) (size!7520 a!3312))) (index!11446 lt!149183)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299953 () Bool)

(assert (=> b!299953 (and (bvsge (index!11446 lt!149183) #b00000000000000000000000000000000) (bvslt (index!11446 lt!149183) (size!7520 (array!15143 (store (arr!7168 a!3312) i!1256 k!2524) (size!7520 a!3312)))))))

(declare-fun res!158104 () Bool)

(assert (=> b!299953 (= res!158104 (= (select (arr!7168 (array!15143 (store (arr!7168 a!3312) i!1256 k!2524) (size!7520 a!3312))) (index!11446 lt!149183)) k!2524))))

(assert (=> b!299953 (=> res!158104 e!189437)))

(declare-fun e!189436 () Bool)

(assert (=> b!299953 (= e!189436 e!189437)))

(declare-fun b!299954 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299954 (= e!189435 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149166 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15143 (store (arr!7168 a!3312) i!1256 k!2524) (size!7520 a!3312)) mask!3809))))

(declare-fun b!299955 () Bool)

(assert (=> b!299955 (= e!189439 e!189436)))

(declare-fun res!158105 () Bool)

(assert (=> b!299955 (= res!158105 (and (is-Intermediate!2317 lt!149183) (not (undefined!3129 lt!149183)) (bvslt (x!29691 lt!149183) #b01111111111111111111111111111110) (bvsge (x!29691 lt!149183) #b00000000000000000000000000000000) (bvsge (x!29691 lt!149183) #b00000000000000000000000000000000)))))

(assert (=> b!299955 (=> (not res!158105) (not e!189436))))

(declare-fun d!67657 () Bool)

(assert (=> d!67657 e!189439))

(declare-fun c!48514 () Bool)

(assert (=> d!67657 (= c!48514 (and (is-Intermediate!2317 lt!149183) (undefined!3129 lt!149183)))))

(declare-fun e!189438 () SeekEntryResult!2317)

(assert (=> d!67657 (= lt!149183 e!189438)))

(declare-fun c!48516 () Bool)

(assert (=> d!67657 (= c!48516 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149184 () (_ BitVec 64))

(assert (=> d!67657 (= lt!149184 (select (arr!7168 (array!15143 (store (arr!7168 a!3312) i!1256 k!2524) (size!7520 a!3312))) lt!149166))))

(assert (=> d!67657 (validMask!0 mask!3809)))

(assert (=> d!67657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149166 k!2524 (array!15143 (store (arr!7168 a!3312) i!1256 k!2524) (size!7520 a!3312)) mask!3809) lt!149183)))

(declare-fun b!299956 () Bool)

(assert (=> b!299956 (= e!189438 (Intermediate!2317 true lt!149166 #b00000000000000000000000000000000))))

(declare-fun b!299957 () Bool)

(assert (=> b!299957 (= e!189438 e!189435)))

(declare-fun c!48515 () Bool)

(assert (=> b!299957 (= c!48515 (or (= lt!149184 k!2524) (= (bvadd lt!149184 lt!149184) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67657 c!48516) b!299956))

(assert (= (and d!67657 (not c!48516)) b!299957))

(assert (= (and b!299957 c!48515) b!299949))

(assert (= (and b!299957 (not c!48515)) b!299954))

(assert (= (and d!67657 c!48514) b!299951))

(assert (= (and d!67657 (not c!48514)) b!299955))

(assert (= (and b!299955 res!158105) b!299953))

(assert (= (and b!299953 (not res!158104)) b!299950))

(assert (= (and b!299950 (not res!158106)) b!299952))

(declare-fun m!312079 () Bool)

(assert (=> b!299950 m!312079))

(assert (=> b!299953 m!312079))

(declare-fun m!312081 () Bool)

(assert (=> b!299954 m!312081))

(assert (=> b!299954 m!312081))

(declare-fun m!312083 () Bool)

(assert (=> b!299954 m!312083))

(declare-fun m!312085 () Bool)

(assert (=> d!67657 m!312085))

(assert (=> d!67657 m!312047))

(assert (=> b!299952 m!312079))

(assert (=> b!299912 d!67657))

(declare-fun b!299958 () Bool)

(declare-fun e!189440 () SeekEntryResult!2317)

(assert (=> b!299958 (= e!189440 (Intermediate!2317 false lt!149166 #b00000000000000000000000000000000))))

(declare-fun b!299959 () Bool)

(declare-fun lt!149185 () SeekEntryResult!2317)

(assert (=> b!299959 (and (bvsge (index!11446 lt!149185) #b00000000000000000000000000000000) (bvslt (index!11446 lt!149185) (size!7520 a!3312)))))

(declare-fun res!158109 () Bool)

(assert (=> b!299959 (= res!158109 (= (select (arr!7168 a!3312) (index!11446 lt!149185)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189442 () Bool)

(assert (=> b!299959 (=> res!158109 e!189442)))

(declare-fun b!299960 () Bool)

(declare-fun e!189444 () Bool)

(assert (=> b!299960 (= e!189444 (bvsge (x!29691 lt!149185) #b01111111111111111111111111111110))))

(declare-fun b!299961 () Bool)

(assert (=> b!299961 (and (bvsge (index!11446 lt!149185) #b00000000000000000000000000000000) (bvslt (index!11446 lt!149185) (size!7520 a!3312)))))

(assert (=> b!299961 (= e!189442 (= (select (arr!7168 a!3312) (index!11446 lt!149185)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299962 () Bool)

(assert (=> b!299962 (and (bvsge (index!11446 lt!149185) #b00000000000000000000000000000000) (bvslt (index!11446 lt!149185) (size!7520 a!3312)))))

(declare-fun res!158107 () Bool)

(assert (=> b!299962 (= res!158107 (= (select (arr!7168 a!3312) (index!11446 lt!149185)) k!2524))))

(assert (=> b!299962 (=> res!158107 e!189442)))

(declare-fun e!189441 () Bool)

(assert (=> b!299962 (= e!189441 e!189442)))

(declare-fun b!299963 () Bool)

(assert (=> b!299963 (= e!189440 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149166 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!299964 () Bool)

(assert (=> b!299964 (= e!189444 e!189441)))

(declare-fun res!158108 () Bool)

(assert (=> b!299964 (= res!158108 (and (is-Intermediate!2317 lt!149185) (not (undefined!3129 lt!149185)) (bvslt (x!29691 lt!149185) #b01111111111111111111111111111110) (bvsge (x!29691 lt!149185) #b00000000000000000000000000000000) (bvsge (x!29691 lt!149185) #b00000000000000000000000000000000)))))

(assert (=> b!299964 (=> (not res!158108) (not e!189441))))

(declare-fun d!67673 () Bool)

(assert (=> d!67673 e!189444))

(declare-fun c!48517 () Bool)

(assert (=> d!67673 (= c!48517 (and (is-Intermediate!2317 lt!149185) (undefined!3129 lt!149185)))))

(declare-fun e!189443 () SeekEntryResult!2317)

(assert (=> d!67673 (= lt!149185 e!189443)))

(declare-fun c!48519 () Bool)

(assert (=> d!67673 (= c!48519 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149186 () (_ BitVec 64))

(assert (=> d!67673 (= lt!149186 (select (arr!7168 a!3312) lt!149166))))

(assert (=> d!67673 (validMask!0 mask!3809)))

(assert (=> d!67673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149166 k!2524 a!3312 mask!3809) lt!149185)))

(declare-fun b!299965 () Bool)

(assert (=> b!299965 (= e!189443 (Intermediate!2317 true lt!149166 #b00000000000000000000000000000000))))

(declare-fun b!299966 () Bool)

(assert (=> b!299966 (= e!189443 e!189440)))

(declare-fun c!48518 () Bool)

(assert (=> b!299966 (= c!48518 (or (= lt!149186 k!2524) (= (bvadd lt!149186 lt!149186) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67673 c!48519) b!299965))

(assert (= (and d!67673 (not c!48519)) b!299966))

(assert (= (and b!299966 c!48518) b!299958))

(assert (= (and b!299966 (not c!48518)) b!299963))

(assert (= (and d!67673 c!48517) b!299960))

(assert (= (and d!67673 (not c!48517)) b!299964))

(assert (= (and b!299964 res!158108) b!299962))

(assert (= (and b!299962 (not res!158107)) b!299959))

(assert (= (and b!299959 (not res!158109)) b!299961))

(declare-fun m!312087 () Bool)

(assert (=> b!299959 m!312087))

(assert (=> b!299962 m!312087))

(assert (=> b!299963 m!312081))

(assert (=> b!299963 m!312081))

(declare-fun m!312089 () Bool)

(assert (=> b!299963 m!312089))

(declare-fun m!312091 () Bool)

(assert (=> d!67673 m!312091))

(assert (=> d!67673 m!312047))

(assert (=> b!299961 m!312087))

(assert (=> b!299912 d!67673))

(declare-fun d!67675 () Bool)

(declare-fun lt!149196 () (_ BitVec 32))

(declare-fun lt!149195 () (_ BitVec 32))

(assert (=> d!67675 (= lt!149196 (bvmul (bvxor lt!149195 (bvlshr lt!149195 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67675 (= lt!149195 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67675 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158110 (let ((h!5319 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29693 (bvmul (bvxor h!5319 (bvlshr h!5319 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29693 (bvlshr x!29693 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158110 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158110 #b00000000000000000000000000000000))))))

(assert (=> d!67675 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!149196 (bvlshr lt!149196 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299912 d!67675))

(declare-fun d!67677 () Bool)

(declare-fun res!158115 () Bool)

(declare-fun e!189455 () Bool)

(assert (=> d!67677 (=> res!158115 e!189455)))

(assert (=> d!67677 (= res!158115 (= (select (arr!7168 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67677 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!189455)))

(declare-fun b!299983 () Bool)

(declare-fun e!189456 () Bool)

(assert (=> b!299983 (= e!189455 e!189456)))

(declare-fun res!158116 () Bool)

(assert (=> b!299983 (=> (not res!158116) (not e!189456))))

(assert (=> b!299983 (= res!158116 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7520 a!3312)))))

(declare-fun b!299984 () Bool)

(assert (=> b!299984 (= e!189456 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67677 (not res!158115)) b!299983))

(assert (= (and b!299983 res!158116) b!299984))

(declare-fun m!312093 () Bool)

(assert (=> d!67677 m!312093))

(declare-fun m!312095 () Bool)

(assert (=> b!299984 m!312095))

(assert (=> b!299908 d!67677))

(declare-fun b!300017 () Bool)

(declare-fun e!189476 () Bool)

(declare-fun call!25843 () Bool)

(assert (=> b!300017 (= e!189476 call!25843)))

(declare-fun b!300018 () Bool)

(declare-fun e!189478 () Bool)

(assert (=> b!300018 (= e!189478 e!189476)))

(declare-fun lt!149213 () (_ BitVec 64))

(assert (=> b!300018 (= lt!149213 (select (arr!7168 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9361 0))(
  ( (Unit!9362) )
))
(declare-fun lt!149214 () Unit!9361)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15142 (_ BitVec 64) (_ BitVec 32)) Unit!9361)

(assert (=> b!300018 (= lt!149214 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149213 #b00000000000000000000000000000000))))

(assert (=> b!300018 (arrayContainsKey!0 a!3312 lt!149213 #b00000000000000000000000000000000)))

(declare-fun lt!149212 () Unit!9361)

(assert (=> b!300018 (= lt!149212 lt!149214)))

(declare-fun res!158127 () Bool)

(assert (=> b!300018 (= res!158127 (= (seekEntryOrOpen!0 (select (arr!7168 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2317 #b00000000000000000000000000000000)))))

(assert (=> b!300018 (=> (not res!158127) (not e!189476))))

(declare-fun d!67679 () Bool)

(declare-fun res!158128 () Bool)

(declare-fun e!189477 () Bool)

(assert (=> d!67679 (=> res!158128 e!189477)))

(assert (=> d!67679 (= res!158128 (bvsge #b00000000000000000000000000000000 (size!7520 a!3312)))))

(assert (=> d!67679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189477)))

(declare-fun b!300019 () Bool)

(assert (=> b!300019 (= e!189477 e!189478)))

(declare-fun c!48537 () Bool)

(assert (=> b!300019 (= c!48537 (validKeyInArray!0 (select (arr!7168 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25840 () Bool)

(assert (=> bm!25840 (= call!25843 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!300020 () Bool)

(assert (=> b!300020 (= e!189478 call!25843)))

(assert (= (and d!67679 (not res!158128)) b!300019))

(assert (= (and b!300019 c!48537) b!300018))

(assert (= (and b!300019 (not c!48537)) b!300020))

(assert (= (and b!300018 res!158127) b!300017))

(assert (= (or b!300017 b!300020) bm!25840))

(assert (=> b!300018 m!312093))

(declare-fun m!312109 () Bool)

(assert (=> b!300018 m!312109))

(declare-fun m!312111 () Bool)

(assert (=> b!300018 m!312111))

(assert (=> b!300018 m!312093))

(declare-fun m!312113 () Bool)

(assert (=> b!300018 m!312113))

(assert (=> b!300019 m!312093))

(assert (=> b!300019 m!312093))

(declare-fun m!312115 () Bool)

(assert (=> b!300019 m!312115))

(declare-fun m!312117 () Bool)

(assert (=> bm!25840 m!312117))

(assert (=> b!299907 d!67679))

(declare-fun b!300087 () Bool)

(declare-fun e!189517 () SeekEntryResult!2317)

(declare-fun e!189516 () SeekEntryResult!2317)

(assert (=> b!300087 (= e!189517 e!189516)))

(declare-fun lt!149240 () (_ BitVec 64))

(declare-fun lt!149239 () SeekEntryResult!2317)

(assert (=> b!300087 (= lt!149240 (select (arr!7168 a!3312) (index!11446 lt!149239)))))

(declare-fun c!48562 () Bool)

(assert (=> b!300087 (= c!48562 (= lt!149240 k!2524))))

(declare-fun b!300088 () Bool)

(declare-fun e!189515 () SeekEntryResult!2317)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15142 (_ BitVec 32)) SeekEntryResult!2317)

(assert (=> b!300088 (= e!189515 (seekKeyOrZeroReturnVacant!0 (x!29691 lt!149239) (index!11446 lt!149239) (index!11446 lt!149239) k!2524 a!3312 mask!3809))))

(declare-fun b!300089 () Bool)

(declare-fun c!48564 () Bool)

(assert (=> b!300089 (= c!48564 (= lt!149240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300089 (= e!189516 e!189515)))

(declare-fun b!300091 () Bool)

(assert (=> b!300091 (= e!189516 (Found!2317 (index!11446 lt!149239)))))

(declare-fun b!300092 () Bool)

(assert (=> b!300092 (= e!189517 Undefined!2317)))

(declare-fun b!300090 () Bool)

(assert (=> b!300090 (= e!189515 (MissingZero!2317 (index!11446 lt!149239)))))

(declare-fun d!67683 () Bool)

(declare-fun lt!149241 () SeekEntryResult!2317)

(assert (=> d!67683 (and (or (is-Undefined!2317 lt!149241) (not (is-Found!2317 lt!149241)) (and (bvsge (index!11445 lt!149241) #b00000000000000000000000000000000) (bvslt (index!11445 lt!149241) (size!7520 a!3312)))) (or (is-Undefined!2317 lt!149241) (is-Found!2317 lt!149241) (not (is-MissingZero!2317 lt!149241)) (and (bvsge (index!11444 lt!149241) #b00000000000000000000000000000000) (bvslt (index!11444 lt!149241) (size!7520 a!3312)))) (or (is-Undefined!2317 lt!149241) (is-Found!2317 lt!149241) (is-MissingZero!2317 lt!149241) (not (is-MissingVacant!2317 lt!149241)) (and (bvsge (index!11447 lt!149241) #b00000000000000000000000000000000) (bvslt (index!11447 lt!149241) (size!7520 a!3312)))) (or (is-Undefined!2317 lt!149241) (ite (is-Found!2317 lt!149241) (= (select (arr!7168 a!3312) (index!11445 lt!149241)) k!2524) (ite (is-MissingZero!2317 lt!149241) (= (select (arr!7168 a!3312) (index!11444 lt!149241)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2317 lt!149241) (= (select (arr!7168 a!3312) (index!11447 lt!149241)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67683 (= lt!149241 e!189517)))

(declare-fun c!48563 () Bool)

(assert (=> d!67683 (= c!48563 (and (is-Intermediate!2317 lt!149239) (undefined!3129 lt!149239)))))

(assert (=> d!67683 (= lt!149239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67683 (validMask!0 mask!3809)))

(assert (=> d!67683 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!149241)))

(assert (= (and d!67683 c!48563) b!300092))

(assert (= (and d!67683 (not c!48563)) b!300087))

(assert (= (and b!300087 c!48562) b!300091))

(assert (= (and b!300087 (not c!48562)) b!300089))

(assert (= (and b!300089 c!48564) b!300090))

(assert (= (and b!300089 (not c!48564)) b!300088))

(declare-fun m!312141 () Bool)

(assert (=> b!300087 m!312141))

(declare-fun m!312145 () Bool)

(assert (=> b!300088 m!312145))

(assert (=> d!67683 m!312047))

(assert (=> d!67683 m!312059))

(declare-fun m!312147 () Bool)

(assert (=> d!67683 m!312147))

(declare-fun m!312149 () Bool)

(assert (=> d!67683 m!312149))

(declare-fun m!312153 () Bool)

(assert (=> d!67683 m!312153))

(assert (=> d!67683 m!312059))

(declare-fun m!312157 () Bool)

(assert (=> d!67683 m!312157))

(assert (=> b!299909 d!67683))

(declare-fun d!67693 () Bool)

(assert (=> d!67693 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

