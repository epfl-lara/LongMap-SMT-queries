; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29444 () Bool)

(assert start!29444)

(declare-fun b!297782 () Bool)

(declare-fun e!188153 () Bool)

(declare-fun e!188154 () Bool)

(assert (=> b!297782 (= e!188153 e!188154)))

(declare-fun res!157033 () Bool)

(assert (=> b!297782 (=> (not res!157033) (not e!188154))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2285 0))(
  ( (MissingZero!2285 (index!11313 (_ BitVec 32))) (Found!2285 (index!11314 (_ BitVec 32))) (Intermediate!2285 (undefined!3097 Bool) (index!11315 (_ BitVec 32)) (x!29552 (_ BitVec 32))) (Undefined!2285) (MissingVacant!2285 (index!11316 (_ BitVec 32))) )
))
(declare-fun lt!147920 () SeekEntryResult!2285)

(declare-fun lt!147923 () Bool)

(assert (=> b!297782 (= res!157033 (or lt!147923 (= lt!147920 (MissingVacant!2285 i!1256))))))

(assert (=> b!297782 (= lt!147923 (= lt!147920 (MissingZero!2285 i!1256)))))

(declare-datatypes ((array!15064 0))(
  ( (array!15065 (arr!7137 (Array (_ BitVec 32) (_ BitVec 64))) (size!7490 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15064)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15064 (_ BitVec 32)) SeekEntryResult!2285)

(assert (=> b!297782 (= lt!147920 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297783 () Bool)

(declare-fun res!157029 () Bool)

(assert (=> b!297783 (=> (not res!157029) (not e!188154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15064 (_ BitVec 32)) Bool)

(assert (=> b!297783 (= res!157029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!157028 () Bool)

(assert (=> start!29444 (=> (not res!157028) (not e!188153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29444 (= res!157028 (validMask!0 mask!3809))))

(assert (=> start!29444 e!188153))

(assert (=> start!29444 true))

(declare-fun array_inv!5109 (array!15064) Bool)

(assert (=> start!29444 (array_inv!5109 a!3312)))

(declare-fun b!297784 () Bool)

(declare-fun lt!147922 () SeekEntryResult!2285)

(get-info :version)

(assert (=> b!297784 (= e!188154 (and (not lt!147923) (= lt!147920 (MissingVacant!2285 i!1256)) ((_ is Intermediate!2285) lt!147922) (undefined!3097 lt!147922)))))

(declare-fun lt!147924 () SeekEntryResult!2285)

(declare-fun lt!147921 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15064 (_ BitVec 32)) SeekEntryResult!2285)

(assert (=> b!297784 (= lt!147924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147921 k0!2524 (array!15065 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7490 a!3312)) mask!3809))))

(assert (=> b!297784 (= lt!147922 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147921 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297784 (= lt!147921 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297785 () Bool)

(declare-fun res!157032 () Bool)

(assert (=> b!297785 (=> (not res!157032) (not e!188153))))

(assert (=> b!297785 (= res!157032 (and (= (size!7490 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7490 a!3312))))))

(declare-fun b!297786 () Bool)

(declare-fun res!157031 () Bool)

(assert (=> b!297786 (=> (not res!157031) (not e!188153))))

(declare-fun arrayContainsKey!0 (array!15064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297786 (= res!157031 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297787 () Bool)

(declare-fun res!157030 () Bool)

(assert (=> b!297787 (=> (not res!157030) (not e!188153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297787 (= res!157030 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29444 res!157028) b!297785))

(assert (= (and b!297785 res!157032) b!297787))

(assert (= (and b!297787 res!157030) b!297786))

(assert (= (and b!297786 res!157031) b!297782))

(assert (= (and b!297782 res!157033) b!297783))

(assert (= (and b!297783 res!157029) b!297784))

(declare-fun m!309933 () Bool)

(assert (=> b!297786 m!309933))

(declare-fun m!309935 () Bool)

(assert (=> b!297783 m!309935))

(declare-fun m!309937 () Bool)

(assert (=> b!297784 m!309937))

(declare-fun m!309939 () Bool)

(assert (=> b!297784 m!309939))

(declare-fun m!309941 () Bool)

(assert (=> b!297784 m!309941))

(declare-fun m!309943 () Bool)

(assert (=> b!297784 m!309943))

(declare-fun m!309945 () Bool)

(assert (=> b!297782 m!309945))

(declare-fun m!309947 () Bool)

(assert (=> start!29444 m!309947))

(declare-fun m!309949 () Bool)

(assert (=> start!29444 m!309949))

(declare-fun m!309951 () Bool)

(assert (=> b!297787 m!309951))

(check-sat (not start!29444) (not b!297786) (not b!297782) (not b!297787) (not b!297783) (not b!297784))
(check-sat)
(get-model)

(declare-fun b!297832 () Bool)

(declare-fun e!188182 () Bool)

(declare-fun e!188181 () Bool)

(assert (=> b!297832 (= e!188182 e!188181)))

(declare-fun c!47963 () Bool)

(assert (=> b!297832 (= c!47963 (validKeyInArray!0 (select (arr!7137 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67097 () Bool)

(declare-fun res!157075 () Bool)

(assert (=> d!67097 (=> res!157075 e!188182)))

(assert (=> d!67097 (= res!157075 (bvsge #b00000000000000000000000000000000 (size!7490 a!3312)))))

(assert (=> d!67097 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188182)))

(declare-fun b!297833 () Bool)

(declare-fun call!25748 () Bool)

(assert (=> b!297833 (= e!188181 call!25748)))

(declare-fun b!297834 () Bool)

(declare-fun e!188180 () Bool)

(assert (=> b!297834 (= e!188181 e!188180)))

(declare-fun lt!147963 () (_ BitVec 64))

(assert (=> b!297834 (= lt!147963 (select (arr!7137 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9259 0))(
  ( (Unit!9260) )
))
(declare-fun lt!147962 () Unit!9259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15064 (_ BitVec 64) (_ BitVec 32)) Unit!9259)

(assert (=> b!297834 (= lt!147962 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147963 #b00000000000000000000000000000000))))

(assert (=> b!297834 (arrayContainsKey!0 a!3312 lt!147963 #b00000000000000000000000000000000)))

(declare-fun lt!147961 () Unit!9259)

(assert (=> b!297834 (= lt!147961 lt!147962)))

(declare-fun res!157074 () Bool)

(assert (=> b!297834 (= res!157074 (= (seekEntryOrOpen!0 (select (arr!7137 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2285 #b00000000000000000000000000000000)))))

(assert (=> b!297834 (=> (not res!157074) (not e!188180))))

(declare-fun b!297835 () Bool)

(assert (=> b!297835 (= e!188180 call!25748)))

(declare-fun bm!25745 () Bool)

(assert (=> bm!25745 (= call!25748 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!67097 (not res!157075)) b!297832))

(assert (= (and b!297832 c!47963) b!297834))

(assert (= (and b!297832 (not c!47963)) b!297833))

(assert (= (and b!297834 res!157074) b!297835))

(assert (= (or b!297835 b!297833) bm!25745))

(declare-fun m!309993 () Bool)

(assert (=> b!297832 m!309993))

(assert (=> b!297832 m!309993))

(declare-fun m!309995 () Bool)

(assert (=> b!297832 m!309995))

(assert (=> b!297834 m!309993))

(declare-fun m!309997 () Bool)

(assert (=> b!297834 m!309997))

(declare-fun m!309999 () Bool)

(assert (=> b!297834 m!309999))

(assert (=> b!297834 m!309993))

(declare-fun m!310001 () Bool)

(assert (=> b!297834 m!310001))

(declare-fun m!310003 () Bool)

(assert (=> bm!25745 m!310003))

(assert (=> b!297783 d!67097))

(declare-fun d!67103 () Bool)

(declare-fun lt!147978 () SeekEntryResult!2285)

(assert (=> d!67103 (and (or ((_ is Undefined!2285) lt!147978) (not ((_ is Found!2285) lt!147978)) (and (bvsge (index!11314 lt!147978) #b00000000000000000000000000000000) (bvslt (index!11314 lt!147978) (size!7490 a!3312)))) (or ((_ is Undefined!2285) lt!147978) ((_ is Found!2285) lt!147978) (not ((_ is MissingZero!2285) lt!147978)) (and (bvsge (index!11313 lt!147978) #b00000000000000000000000000000000) (bvslt (index!11313 lt!147978) (size!7490 a!3312)))) (or ((_ is Undefined!2285) lt!147978) ((_ is Found!2285) lt!147978) ((_ is MissingZero!2285) lt!147978) (not ((_ is MissingVacant!2285) lt!147978)) (and (bvsge (index!11316 lt!147978) #b00000000000000000000000000000000) (bvslt (index!11316 lt!147978) (size!7490 a!3312)))) (or ((_ is Undefined!2285) lt!147978) (ite ((_ is Found!2285) lt!147978) (= (select (arr!7137 a!3312) (index!11314 lt!147978)) k0!2524) (ite ((_ is MissingZero!2285) lt!147978) (= (select (arr!7137 a!3312) (index!11313 lt!147978)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2285) lt!147978) (= (select (arr!7137 a!3312) (index!11316 lt!147978)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!188209 () SeekEntryResult!2285)

(assert (=> d!67103 (= lt!147978 e!188209)))

(declare-fun c!47984 () Bool)

(declare-fun lt!147979 () SeekEntryResult!2285)

(assert (=> d!67103 (= c!47984 (and ((_ is Intermediate!2285) lt!147979) (undefined!3097 lt!147979)))))

(assert (=> d!67103 (= lt!147979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67103 (validMask!0 mask!3809)))

(assert (=> d!67103 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!147978)))

(declare-fun b!297884 () Bool)

(declare-fun e!188211 () SeekEntryResult!2285)

(assert (=> b!297884 (= e!188211 (Found!2285 (index!11315 lt!147979)))))

(declare-fun b!297885 () Bool)

(assert (=> b!297885 (= e!188209 Undefined!2285)))

(declare-fun b!297886 () Bool)

(declare-fun e!188210 () SeekEntryResult!2285)

(assert (=> b!297886 (= e!188210 (MissingZero!2285 (index!11315 lt!147979)))))

(declare-fun b!297887 () Bool)

(assert (=> b!297887 (= e!188209 e!188211)))

(declare-fun lt!147980 () (_ BitVec 64))

(assert (=> b!297887 (= lt!147980 (select (arr!7137 a!3312) (index!11315 lt!147979)))))

(declare-fun c!47982 () Bool)

(assert (=> b!297887 (= c!47982 (= lt!147980 k0!2524))))

(declare-fun b!297888 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15064 (_ BitVec 32)) SeekEntryResult!2285)

(assert (=> b!297888 (= e!188210 (seekKeyOrZeroReturnVacant!0 (x!29552 lt!147979) (index!11315 lt!147979) (index!11315 lt!147979) k0!2524 a!3312 mask!3809))))

(declare-fun b!297889 () Bool)

(declare-fun c!47983 () Bool)

(assert (=> b!297889 (= c!47983 (= lt!147980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297889 (= e!188211 e!188210)))

(assert (= (and d!67103 c!47984) b!297885))

(assert (= (and d!67103 (not c!47984)) b!297887))

(assert (= (and b!297887 c!47982) b!297884))

(assert (= (and b!297887 (not c!47982)) b!297889))

(assert (= (and b!297889 c!47983) b!297886))

(assert (= (and b!297889 (not c!47983)) b!297888))

(declare-fun m!310019 () Bool)

(assert (=> d!67103 m!310019))

(declare-fun m!310021 () Bool)

(assert (=> d!67103 m!310021))

(declare-fun m!310023 () Bool)

(assert (=> d!67103 m!310023))

(assert (=> d!67103 m!309943))

(assert (=> d!67103 m!309947))

(assert (=> d!67103 m!309943))

(declare-fun m!310025 () Bool)

(assert (=> d!67103 m!310025))

(declare-fun m!310027 () Bool)

(assert (=> b!297887 m!310027))

(declare-fun m!310029 () Bool)

(assert (=> b!297888 m!310029))

(assert (=> b!297782 d!67103))

(declare-fun d!67113 () Bool)

(assert (=> d!67113 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!297787 d!67113))

(declare-fun d!67115 () Bool)

(declare-fun res!157093 () Bool)

(declare-fun e!188216 () Bool)

(assert (=> d!67115 (=> res!157093 e!188216)))

(assert (=> d!67115 (= res!157093 (= (select (arr!7137 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67115 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188216)))

(declare-fun b!297894 () Bool)

(declare-fun e!188217 () Bool)

(assert (=> b!297894 (= e!188216 e!188217)))

(declare-fun res!157094 () Bool)

(assert (=> b!297894 (=> (not res!157094) (not e!188217))))

(assert (=> b!297894 (= res!157094 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7490 a!3312)))))

(declare-fun b!297895 () Bool)

(assert (=> b!297895 (= e!188217 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67115 (not res!157093)) b!297894))

(assert (= (and b!297894 res!157094) b!297895))

(assert (=> d!67115 m!309993))

(declare-fun m!310031 () Bool)

(assert (=> b!297895 m!310031))

(assert (=> b!297786 d!67115))

(declare-fun d!67119 () Bool)

(assert (=> d!67119 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29444 d!67119))

(declare-fun d!67125 () Bool)

(assert (=> d!67125 (= (array_inv!5109 a!3312) (bvsge (size!7490 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29444 d!67125))

(declare-fun lt!148014 () SeekEntryResult!2285)

(declare-fun b!297980 () Bool)

(assert (=> b!297980 (and (bvsge (index!11315 lt!148014) #b00000000000000000000000000000000) (bvslt (index!11315 lt!148014) (size!7490 (array!15065 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7490 a!3312)))))))

(declare-fun res!157127 () Bool)

(assert (=> b!297980 (= res!157127 (= (select (arr!7137 (array!15065 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7490 a!3312))) (index!11315 lt!148014)) k0!2524))))

(declare-fun e!188272 () Bool)

(assert (=> b!297980 (=> res!157127 e!188272)))

(declare-fun e!188273 () Bool)

(assert (=> b!297980 (= e!188273 e!188272)))

(declare-fun b!297981 () Bool)

(declare-fun e!188269 () SeekEntryResult!2285)

(assert (=> b!297981 (= e!188269 (Intermediate!2285 false lt!147921 #b00000000000000000000000000000000))))

(declare-fun d!67127 () Bool)

(declare-fun e!188271 () Bool)

(assert (=> d!67127 e!188271))

(declare-fun c!48013 () Bool)

(assert (=> d!67127 (= c!48013 (and ((_ is Intermediate!2285) lt!148014) (undefined!3097 lt!148014)))))

(declare-fun e!188270 () SeekEntryResult!2285)

(assert (=> d!67127 (= lt!148014 e!188270)))

(declare-fun c!48012 () Bool)

(assert (=> d!67127 (= c!48012 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148015 () (_ BitVec 64))

(assert (=> d!67127 (= lt!148015 (select (arr!7137 (array!15065 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7490 a!3312))) lt!147921))))

(assert (=> d!67127 (validMask!0 mask!3809)))

(assert (=> d!67127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147921 k0!2524 (array!15065 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7490 a!3312)) mask!3809) lt!148014)))

(declare-fun b!297982 () Bool)

(assert (=> b!297982 (and (bvsge (index!11315 lt!148014) #b00000000000000000000000000000000) (bvslt (index!11315 lt!148014) (size!7490 (array!15065 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7490 a!3312)))))))

(assert (=> b!297982 (= e!188272 (= (select (arr!7137 (array!15065 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7490 a!3312))) (index!11315 lt!148014)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297983 () Bool)

(assert (=> b!297983 (= e!188271 (bvsge (x!29552 lt!148014) #b01111111111111111111111111111110))))

(declare-fun b!297984 () Bool)

(assert (=> b!297984 (= e!188271 e!188273)))

(declare-fun res!157128 () Bool)

(assert (=> b!297984 (= res!157128 (and ((_ is Intermediate!2285) lt!148014) (not (undefined!3097 lt!148014)) (bvslt (x!29552 lt!148014) #b01111111111111111111111111111110) (bvsge (x!29552 lt!148014) #b00000000000000000000000000000000) (bvsge (x!29552 lt!148014) #b00000000000000000000000000000000)))))

(assert (=> b!297984 (=> (not res!157128) (not e!188273))))

(declare-fun b!297985 () Bool)

(assert (=> b!297985 (= e!188270 e!188269)))

(declare-fun c!48014 () Bool)

(assert (=> b!297985 (= c!48014 (or (= lt!148015 k0!2524) (= (bvadd lt!148015 lt!148015) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297986 () Bool)

(assert (=> b!297986 (and (bvsge (index!11315 lt!148014) #b00000000000000000000000000000000) (bvslt (index!11315 lt!148014) (size!7490 (array!15065 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7490 a!3312)))))))

(declare-fun res!157126 () Bool)

(assert (=> b!297986 (= res!157126 (= (select (arr!7137 (array!15065 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7490 a!3312))) (index!11315 lt!148014)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297986 (=> res!157126 e!188272)))

(declare-fun b!297987 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297987 (= e!188269 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147921 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15065 (store (arr!7137 a!3312) i!1256 k0!2524) (size!7490 a!3312)) mask!3809))))

(declare-fun b!297988 () Bool)

(assert (=> b!297988 (= e!188270 (Intermediate!2285 true lt!147921 #b00000000000000000000000000000000))))

(assert (= (and d!67127 c!48012) b!297988))

(assert (= (and d!67127 (not c!48012)) b!297985))

(assert (= (and b!297985 c!48014) b!297981))

(assert (= (and b!297985 (not c!48014)) b!297987))

(assert (= (and d!67127 c!48013) b!297983))

(assert (= (and d!67127 (not c!48013)) b!297984))

(assert (= (and b!297984 res!157128) b!297980))

(assert (= (and b!297980 (not res!157127)) b!297986))

(assert (= (and b!297986 (not res!157126)) b!297982))

(declare-fun m!310067 () Bool)

(assert (=> b!297982 m!310067))

(declare-fun m!310069 () Bool)

(assert (=> d!67127 m!310069))

(assert (=> d!67127 m!309947))

(assert (=> b!297980 m!310067))

(declare-fun m!310071 () Bool)

(assert (=> b!297987 m!310071))

(assert (=> b!297987 m!310071))

(declare-fun m!310073 () Bool)

(assert (=> b!297987 m!310073))

(assert (=> b!297986 m!310067))

(assert (=> b!297784 d!67127))

(declare-fun b!298001 () Bool)

(declare-fun lt!148022 () SeekEntryResult!2285)

(assert (=> b!298001 (and (bvsge (index!11315 lt!148022) #b00000000000000000000000000000000) (bvslt (index!11315 lt!148022) (size!7490 a!3312)))))

(declare-fun res!157130 () Bool)

(assert (=> b!298001 (= res!157130 (= (select (arr!7137 a!3312) (index!11315 lt!148022)) k0!2524))))

(declare-fun e!188283 () Bool)

(assert (=> b!298001 (=> res!157130 e!188283)))

(declare-fun e!188284 () Bool)

(assert (=> b!298001 (= e!188284 e!188283)))

(declare-fun b!298002 () Bool)

(declare-fun e!188280 () SeekEntryResult!2285)

(assert (=> b!298002 (= e!188280 (Intermediate!2285 false lt!147921 #b00000000000000000000000000000000))))

(declare-fun d!67139 () Bool)

(declare-fun e!188282 () Bool)

(assert (=> d!67139 e!188282))

(declare-fun c!48022 () Bool)

(assert (=> d!67139 (= c!48022 (and ((_ is Intermediate!2285) lt!148022) (undefined!3097 lt!148022)))))

(declare-fun e!188281 () SeekEntryResult!2285)

(assert (=> d!67139 (= lt!148022 e!188281)))

(declare-fun c!48021 () Bool)

(assert (=> d!67139 (= c!48021 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148023 () (_ BitVec 64))

(assert (=> d!67139 (= lt!148023 (select (arr!7137 a!3312) lt!147921))))

(assert (=> d!67139 (validMask!0 mask!3809)))

(assert (=> d!67139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147921 k0!2524 a!3312 mask!3809) lt!148022)))

(declare-fun b!298003 () Bool)

(assert (=> b!298003 (and (bvsge (index!11315 lt!148022) #b00000000000000000000000000000000) (bvslt (index!11315 lt!148022) (size!7490 a!3312)))))

(assert (=> b!298003 (= e!188283 (= (select (arr!7137 a!3312) (index!11315 lt!148022)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298004 () Bool)

(assert (=> b!298004 (= e!188282 (bvsge (x!29552 lt!148022) #b01111111111111111111111111111110))))

(declare-fun b!298005 () Bool)

(assert (=> b!298005 (= e!188282 e!188284)))

(declare-fun res!157131 () Bool)

(assert (=> b!298005 (= res!157131 (and ((_ is Intermediate!2285) lt!148022) (not (undefined!3097 lt!148022)) (bvslt (x!29552 lt!148022) #b01111111111111111111111111111110) (bvsge (x!29552 lt!148022) #b00000000000000000000000000000000) (bvsge (x!29552 lt!148022) #b00000000000000000000000000000000)))))

(assert (=> b!298005 (=> (not res!157131) (not e!188284))))

(declare-fun b!298006 () Bool)

(assert (=> b!298006 (= e!188281 e!188280)))

(declare-fun c!48023 () Bool)

(assert (=> b!298006 (= c!48023 (or (= lt!148023 k0!2524) (= (bvadd lt!148023 lt!148023) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298007 () Bool)

(assert (=> b!298007 (and (bvsge (index!11315 lt!148022) #b00000000000000000000000000000000) (bvslt (index!11315 lt!148022) (size!7490 a!3312)))))

(declare-fun res!157129 () Bool)

(assert (=> b!298007 (= res!157129 (= (select (arr!7137 a!3312) (index!11315 lt!148022)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298007 (=> res!157129 e!188283)))

(declare-fun b!298008 () Bool)

(assert (=> b!298008 (= e!188280 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147921 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298009 () Bool)

(assert (=> b!298009 (= e!188281 (Intermediate!2285 true lt!147921 #b00000000000000000000000000000000))))

(assert (= (and d!67139 c!48021) b!298009))

(assert (= (and d!67139 (not c!48021)) b!298006))

(assert (= (and b!298006 c!48023) b!298002))

(assert (= (and b!298006 (not c!48023)) b!298008))

(assert (= (and d!67139 c!48022) b!298004))

(assert (= (and d!67139 (not c!48022)) b!298005))

(assert (= (and b!298005 res!157131) b!298001))

(assert (= (and b!298001 (not res!157130)) b!298007))

(assert (= (and b!298007 (not res!157129)) b!298003))

(declare-fun m!310075 () Bool)

(assert (=> b!298003 m!310075))

(declare-fun m!310077 () Bool)

(assert (=> d!67139 m!310077))

(assert (=> d!67139 m!309947))

(assert (=> b!298001 m!310075))

(assert (=> b!298008 m!310071))

(assert (=> b!298008 m!310071))

(declare-fun m!310079 () Bool)

(assert (=> b!298008 m!310079))

(assert (=> b!298007 m!310075))

(assert (=> b!297784 d!67139))

(declare-fun d!67143 () Bool)

(declare-fun lt!148032 () (_ BitVec 32))

(declare-fun lt!148031 () (_ BitVec 32))

(assert (=> d!67143 (= lt!148032 (bvmul (bvxor lt!148031 (bvlshr lt!148031 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67143 (= lt!148031 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67143 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157132 (let ((h!5274 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29560 (bvmul (bvxor h!5274 (bvlshr h!5274 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29560 (bvlshr x!29560 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157132 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157132 #b00000000000000000000000000000000))))))

(assert (=> d!67143 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148032 (bvlshr lt!148032 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!297784 d!67143))

(check-sat (not b!297987) (not b!297832) (not b!297888) (not b!297834) (not bm!25745) (not b!297895) (not d!67139) (not d!67127) (not b!298008) (not d!67103))
(check-sat)
