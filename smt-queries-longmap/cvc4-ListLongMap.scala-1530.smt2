; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28970 () Bool)

(assert start!28970)

(declare-fun lt!146097 () Bool)

(declare-fun b!294690 () Bool)

(declare-fun e!186282 () Bool)

(declare-datatypes ((SeekEntryResult!2218 0))(
  ( (MissingZero!2218 (index!11042 (_ BitVec 32))) (Found!2218 (index!11043 (_ BitVec 32))) (Intermediate!2218 (undefined!3030 Bool) (index!11044 (_ BitVec 32)) (x!29244 (_ BitVec 32))) (Undefined!2218) (MissingVacant!2218 (index!11045 (_ BitVec 32))) )
))
(declare-fun lt!146098 () SeekEntryResult!2218)

(declare-datatypes ((array!14908 0))(
  ( (array!14909 (arr!7069 (Array (_ BitVec 32) (_ BitVec 64))) (size!7421 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14908)

(declare-fun k!2524 () (_ BitVec 64))

(assert (=> b!294690 (= e!186282 (and lt!146097 (let ((bdg!6241 (not (is-Intermediate!2218 lt!146098)))) (and (or bdg!6241 (not (undefined!3030 lt!146098))) (or bdg!6241 (not (= (select (arr!7069 a!3312) (index!11044 lt!146098)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6241 (not (= (select (arr!7069 a!3312) (index!11044 lt!146098)) k!2524))) (not bdg!6241) (or (bvslt (index!11044 lt!146098) #b00000000000000000000000000000000) (bvsge (index!11044 lt!146098) (size!7421 a!3312)))))))))

(declare-fun lt!146099 () (_ BitVec 32))

(declare-fun lt!146100 () SeekEntryResult!2218)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14908 (_ BitVec 32)) SeekEntryResult!2218)

(assert (=> b!294690 (= lt!146100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146099 k!2524 (array!14909 (store (arr!7069 a!3312) i!1256 k!2524) (size!7421 a!3312)) mask!3809))))

(assert (=> b!294690 (= lt!146098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146099 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294690 (= lt!146099 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!294691 () Bool)

(declare-fun res!154923 () Bool)

(assert (=> b!294691 (=> (not res!154923) (not e!186282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14908 (_ BitVec 32)) Bool)

(assert (=> b!294691 (= res!154923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294692 () Bool)

(declare-fun res!154922 () Bool)

(declare-fun e!186283 () Bool)

(assert (=> b!294692 (=> (not res!154922) (not e!186283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294692 (= res!154922 (validKeyInArray!0 k!2524))))

(declare-fun b!294693 () Bool)

(declare-fun res!154924 () Bool)

(assert (=> b!294693 (=> (not res!154924) (not e!186283))))

(declare-fun arrayContainsKey!0 (array!14908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294693 (= res!154924 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294694 () Bool)

(declare-fun res!154925 () Bool)

(assert (=> b!294694 (=> (not res!154925) (not e!186283))))

(assert (=> b!294694 (= res!154925 (and (= (size!7421 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7421 a!3312))))))

(declare-fun b!294695 () Bool)

(assert (=> b!294695 (= e!186283 e!186282)))

(declare-fun res!154921 () Bool)

(assert (=> b!294695 (=> (not res!154921) (not e!186282))))

(declare-fun lt!146096 () SeekEntryResult!2218)

(assert (=> b!294695 (= res!154921 (or lt!146097 (= lt!146096 (MissingVacant!2218 i!1256))))))

(assert (=> b!294695 (= lt!146097 (= lt!146096 (MissingZero!2218 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14908 (_ BitVec 32)) SeekEntryResult!2218)

(assert (=> b!294695 (= lt!146096 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!154926 () Bool)

(assert (=> start!28970 (=> (not res!154926) (not e!186283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28970 (= res!154926 (validMask!0 mask!3809))))

(assert (=> start!28970 e!186283))

(assert (=> start!28970 true))

(declare-fun array_inv!5032 (array!14908) Bool)

(assert (=> start!28970 (array_inv!5032 a!3312)))

(assert (= (and start!28970 res!154926) b!294694))

(assert (= (and b!294694 res!154925) b!294692))

(assert (= (and b!294692 res!154922) b!294693))

(assert (= (and b!294693 res!154924) b!294695))

(assert (= (and b!294695 res!154921) b!294691))

(assert (= (and b!294691 res!154923) b!294690))

(declare-fun m!308075 () Bool)

(assert (=> b!294692 m!308075))

(declare-fun m!308077 () Bool)

(assert (=> b!294691 m!308077))

(declare-fun m!308079 () Bool)

(assert (=> b!294690 m!308079))

(declare-fun m!308081 () Bool)

(assert (=> b!294690 m!308081))

(declare-fun m!308083 () Bool)

(assert (=> b!294690 m!308083))

(declare-fun m!308085 () Bool)

(assert (=> b!294690 m!308085))

(declare-fun m!308087 () Bool)

(assert (=> b!294690 m!308087))

(declare-fun m!308089 () Bool)

(assert (=> start!28970 m!308089))

(declare-fun m!308091 () Bool)

(assert (=> start!28970 m!308091))

(declare-fun m!308093 () Bool)

(assert (=> b!294693 m!308093))

(declare-fun m!308095 () Bool)

(assert (=> b!294695 m!308095))

(push 1)

(assert (not b!294690))

(assert (not b!294692))

(assert (not b!294695))

(assert (not b!294693))

(assert (not b!294691))

(assert (not start!28970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66855 () Bool)

(assert (=> d!66855 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294692 d!66855))

(declare-fun d!66857 () Bool)

(declare-fun res!154931 () Bool)

(declare-fun e!186297 () Bool)

(assert (=> d!66857 (=> res!154931 e!186297)))

(assert (=> d!66857 (= res!154931 (= (select (arr!7069 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66857 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!186297)))

(declare-fun b!294718 () Bool)

(declare-fun e!186298 () Bool)

(assert (=> b!294718 (= e!186297 e!186298)))

(declare-fun res!154932 () Bool)

(assert (=> b!294718 (=> (not res!154932) (not e!186298))))

(assert (=> b!294718 (= res!154932 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7421 a!3312)))))

(declare-fun b!294719 () Bool)

(assert (=> b!294719 (= e!186298 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66857 (not res!154931)) b!294718))

(assert (= (and b!294718 res!154932) b!294719))

(declare-fun m!308109 () Bool)

(assert (=> d!66857 m!308109))

(declare-fun m!308111 () Bool)

(assert (=> b!294719 m!308111))

(assert (=> b!294693 d!66857))

(declare-fun b!294742 () Bool)

(declare-fun e!186314 () Bool)

(declare-fun e!186315 () Bool)

(assert (=> b!294742 (= e!186314 e!186315)))

(declare-fun lt!146129 () (_ BitVec 64))

(assert (=> b!294742 (= lt!146129 (select (arr!7069 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9210 0))(
  ( (Unit!9211) )
))
(declare-fun lt!146130 () Unit!9210)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14908 (_ BitVec 64) (_ BitVec 32)) Unit!9210)

(assert (=> b!294742 (= lt!146130 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146129 #b00000000000000000000000000000000))))

(assert (=> b!294742 (arrayContainsKey!0 a!3312 lt!146129 #b00000000000000000000000000000000)))

(declare-fun lt!146131 () Unit!9210)

(assert (=> b!294742 (= lt!146131 lt!146130)))

(declare-fun res!154944 () Bool)

(assert (=> b!294742 (= res!154944 (= (seekEntryOrOpen!0 (select (arr!7069 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2218 #b00000000000000000000000000000000)))))

(assert (=> b!294742 (=> (not res!154944) (not e!186315))))

(declare-fun d!66861 () Bool)

(declare-fun res!154943 () Bool)

(declare-fun e!186316 () Bool)

(assert (=> d!66861 (=> res!154943 e!186316)))

(assert (=> d!66861 (= res!154943 (bvsge #b00000000000000000000000000000000 (size!7421 a!3312)))))

(assert (=> d!66861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186316)))

(declare-fun b!294743 () Bool)

(declare-fun call!25714 () Bool)

(assert (=> b!294743 (= e!186315 call!25714)))

(declare-fun b!294744 () Bool)

(assert (=> b!294744 (= e!186314 call!25714)))

(declare-fun bm!25711 () Bool)

(assert (=> bm!25711 (= call!25714 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294746 () Bool)

(assert (=> b!294746 (= e!186316 e!186314)))

(declare-fun c!47472 () Bool)

(assert (=> b!294746 (= c!47472 (validKeyInArray!0 (select (arr!7069 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66861 (not res!154943)) b!294746))

(assert (= (and b!294746 c!47472) b!294742))

(assert (= (and b!294746 (not c!47472)) b!294744))

(assert (= (and b!294742 res!154944) b!294743))

(assert (= (or b!294743 b!294744) bm!25711))

(assert (=> b!294742 m!308109))

(declare-fun m!308125 () Bool)

(assert (=> b!294742 m!308125))

(declare-fun m!308127 () Bool)

(assert (=> b!294742 m!308127))

(assert (=> b!294742 m!308109))

(declare-fun m!308129 () Bool)

(assert (=> b!294742 m!308129))

(declare-fun m!308131 () Bool)

(assert (=> bm!25711 m!308131))

(assert (=> b!294746 m!308109))

(assert (=> b!294746 m!308109))

(declare-fun m!308133 () Bool)

(assert (=> b!294746 m!308133))

(assert (=> b!294691 d!66861))

(declare-fun b!294827 () Bool)

(declare-fun e!186366 () SeekEntryResult!2218)

(assert (=> b!294827 (= e!186366 Undefined!2218)))

(declare-fun b!294828 () Bool)

(declare-fun e!186365 () SeekEntryResult!2218)

(declare-fun lt!146161 () SeekEntryResult!2218)

(assert (=> b!294828 (= e!186365 (MissingZero!2218 (index!11044 lt!146161)))))

(declare-fun b!294829 () Bool)

(declare-fun c!47503 () Bool)

(declare-fun lt!146162 () (_ BitVec 64))

(assert (=> b!294829 (= c!47503 (= lt!146162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186364 () SeekEntryResult!2218)

(assert (=> b!294829 (= e!186364 e!186365)))

(declare-fun b!294830 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14908 (_ BitVec 32)) SeekEntryResult!2218)

(assert (=> b!294830 (= e!186365 (seekKeyOrZeroReturnVacant!0 (x!29244 lt!146161) (index!11044 lt!146161) (index!11044 lt!146161) k!2524 a!3312 mask!3809))))

(declare-fun b!294831 () Bool)

(assert (=> b!294831 (= e!186364 (Found!2218 (index!11044 lt!146161)))))

(declare-fun b!294832 () Bool)

(assert (=> b!294832 (= e!186366 e!186364)))

(assert (=> b!294832 (= lt!146162 (select (arr!7069 a!3312) (index!11044 lt!146161)))))

(declare-fun c!47502 () Bool)

(assert (=> b!294832 (= c!47502 (= lt!146162 k!2524))))

(declare-fun d!66867 () Bool)

(declare-fun lt!146160 () SeekEntryResult!2218)

(assert (=> d!66867 (and (or (is-Undefined!2218 lt!146160) (not (is-Found!2218 lt!146160)) (and (bvsge (index!11043 lt!146160) #b00000000000000000000000000000000) (bvslt (index!11043 lt!146160) (size!7421 a!3312)))) (or (is-Undefined!2218 lt!146160) (is-Found!2218 lt!146160) (not (is-MissingZero!2218 lt!146160)) (and (bvsge (index!11042 lt!146160) #b00000000000000000000000000000000) (bvslt (index!11042 lt!146160) (size!7421 a!3312)))) (or (is-Undefined!2218 lt!146160) (is-Found!2218 lt!146160) (is-MissingZero!2218 lt!146160) (not (is-MissingVacant!2218 lt!146160)) (and (bvsge (index!11045 lt!146160) #b00000000000000000000000000000000) (bvslt (index!11045 lt!146160) (size!7421 a!3312)))) (or (is-Undefined!2218 lt!146160) (ite (is-Found!2218 lt!146160) (= (select (arr!7069 a!3312) (index!11043 lt!146160)) k!2524) (ite (is-MissingZero!2218 lt!146160) (= (select (arr!7069 a!3312) (index!11042 lt!146160)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2218 lt!146160) (= (select (arr!7069 a!3312) (index!11045 lt!146160)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66867 (= lt!146160 e!186366)))

(declare-fun c!47504 () Bool)

(assert (=> d!66867 (= c!47504 (and (is-Intermediate!2218 lt!146161) (undefined!3030 lt!146161)))))

(assert (=> d!66867 (= lt!146161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66867 (validMask!0 mask!3809)))

(assert (=> d!66867 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!146160)))

(assert (= (and d!66867 c!47504) b!294827))

(assert (= (and d!66867 (not c!47504)) b!294832))

(assert (= (and b!294832 c!47502) b!294831))

(assert (= (and b!294832 (not c!47502)) b!294829))

(assert (= (and b!294829 c!47503) b!294828))

(assert (= (and b!294829 (not c!47503)) b!294830))

(declare-fun m!308157 () Bool)

(assert (=> b!294830 m!308157))

(declare-fun m!308159 () Bool)

(assert (=> b!294832 m!308159))

(assert (=> d!66867 m!308089))

(declare-fun m!308161 () Bool)

(assert (=> d!66867 m!308161))

(assert (=> d!66867 m!308087))

(declare-fun m!308163 () Bool)

(assert (=> d!66867 m!308163))

(assert (=> d!66867 m!308087))

(declare-fun m!308165 () Bool)

(assert (=> d!66867 m!308165))

(declare-fun m!308167 () Bool)

(assert (=> d!66867 m!308167))

(assert (=> b!294695 d!66867))

(declare-fun e!186397 () SeekEntryResult!2218)

(declare-fun b!294876 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294876 (= e!186397 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146099 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14909 (store (arr!7069 a!3312) i!1256 k!2524) (size!7421 a!3312)) mask!3809))))

(declare-fun b!294877 () Bool)

(declare-fun e!186400 () Bool)

(declare-fun e!186401 () Bool)

(assert (=> b!294877 (= e!186400 e!186401)))

(declare-fun res!154995 () Bool)

(declare-fun lt!146179 () SeekEntryResult!2218)

(assert (=> b!294877 (= res!154995 (and (is-Intermediate!2218 lt!146179) (not (undefined!3030 lt!146179)) (bvslt (x!29244 lt!146179) #b01111111111111111111111111111110) (bvsge (x!29244 lt!146179) #b00000000000000000000000000000000) (bvsge (x!29244 lt!146179) #b00000000000000000000000000000000)))))

(assert (=> b!294877 (=> (not res!154995) (not e!186401))))

(declare-fun b!294878 () Bool)

(declare-fun e!186399 () SeekEntryResult!2218)

(assert (=> b!294878 (= e!186399 e!186397)))

(declare-fun c!47515 () Bool)

(declare-fun lt!146178 () (_ BitVec 64))

(assert (=> b!294878 (= c!47515 (or (= lt!146178 k!2524) (= (bvadd lt!146178 lt!146178) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294879 () Bool)

(assert (=> b!294879 (= e!186397 (Intermediate!2218 false lt!146099 #b00000000000000000000000000000000))))

(declare-fun b!294880 () Bool)

(assert (=> b!294880 (and (bvsge (index!11044 lt!146179) #b00000000000000000000000000000000) (bvslt (index!11044 lt!146179) (size!7421 (array!14909 (store (arr!7069 a!3312) i!1256 k!2524) (size!7421 a!3312)))))))

(declare-fun e!186398 () Bool)

(assert (=> b!294880 (= e!186398 (= (select (arr!7069 (array!14909 (store (arr!7069 a!3312) i!1256 k!2524) (size!7421 a!3312))) (index!11044 lt!146179)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294881 () Bool)

(assert (=> b!294881 (and (bvsge (index!11044 lt!146179) #b00000000000000000000000000000000) (bvslt (index!11044 lt!146179) (size!7421 (array!14909 (store (arr!7069 a!3312) i!1256 k!2524) (size!7421 a!3312)))))))

(declare-fun res!154996 () Bool)

(assert (=> b!294881 (= res!154996 (= (select (arr!7069 (array!14909 (store (arr!7069 a!3312) i!1256 k!2524) (size!7421 a!3312))) (index!11044 lt!146179)) k!2524))))

(assert (=> b!294881 (=> res!154996 e!186398)))

(assert (=> b!294881 (= e!186401 e!186398)))

(declare-fun b!294882 () Bool)

(assert (=> b!294882 (= e!186400 (bvsge (x!29244 lt!146179) #b01111111111111111111111111111110))))

(declare-fun b!294883 () Bool)

(assert (=> b!294883 (= e!186399 (Intermediate!2218 true lt!146099 #b00000000000000000000000000000000))))

(declare-fun d!66879 () Bool)

(assert (=> d!66879 e!186400))

(declare-fun c!47516 () Bool)

(assert (=> d!66879 (= c!47516 (and (is-Intermediate!2218 lt!146179) (undefined!3030 lt!146179)))))

(assert (=> d!66879 (= lt!146179 e!186399)))

(declare-fun c!47517 () Bool)

(assert (=> d!66879 (= c!47517 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66879 (= lt!146178 (select (arr!7069 (array!14909 (store (arr!7069 a!3312) i!1256 k!2524) (size!7421 a!3312))) lt!146099))))

(assert (=> d!66879 (validMask!0 mask!3809)))

(assert (=> d!66879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146099 k!2524 (array!14909 (store (arr!7069 a!3312) i!1256 k!2524) (size!7421 a!3312)) mask!3809) lt!146179)))

(declare-fun b!294884 () Bool)

(assert (=> b!294884 (and (bvsge (index!11044 lt!146179) #b00000000000000000000000000000000) (bvslt (index!11044 lt!146179) (size!7421 (array!14909 (store (arr!7069 a!3312) i!1256 k!2524) (size!7421 a!3312)))))))

(declare-fun res!154997 () Bool)

(assert (=> b!294884 (= res!154997 (= (select (arr!7069 (array!14909 (store (arr!7069 a!3312) i!1256 k!2524) (size!7421 a!3312))) (index!11044 lt!146179)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294884 (=> res!154997 e!186398)))

(assert (= (and d!66879 c!47517) b!294883))

(assert (= (and d!66879 (not c!47517)) b!294878))

(assert (= (and b!294878 c!47515) b!294879))

(assert (= (and b!294878 (not c!47515)) b!294876))

(assert (= (and d!66879 c!47516) b!294882))

(assert (= (and d!66879 (not c!47516)) b!294877))

(assert (= (and b!294877 res!154995) b!294881))

(assert (= (and b!294881 (not res!154996)) b!294884))

(assert (= (and b!294884 (not res!154997)) b!294880))

(declare-fun m!308191 () Bool)

(assert (=> b!294884 m!308191))

(assert (=> b!294880 m!308191))

(declare-fun m!308193 () Bool)

(assert (=> b!294876 m!308193))

(assert (=> b!294876 m!308193))

(declare-fun m!308195 () Bool)

(assert (=> b!294876 m!308195))

(declare-fun m!308197 () Bool)

(assert (=> d!66879 m!308197))

(assert (=> d!66879 m!308089))

(assert (=> b!294881 m!308191))

(assert (=> b!294690 d!66879))

(declare-fun e!186402 () SeekEntryResult!2218)

(declare-fun b!294885 () Bool)

(assert (=> b!294885 (= e!186402 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146099 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!294886 () Bool)

(declare-fun e!186405 () Bool)

(declare-fun e!186406 () Bool)

(assert (=> b!294886 (= e!186405 e!186406)))

(declare-fun res!154998 () Bool)

(declare-fun lt!146181 () SeekEntryResult!2218)

(assert (=> b!294886 (= res!154998 (and (is-Intermediate!2218 lt!146181) (not (undefined!3030 lt!146181)) (bvslt (x!29244 lt!146181) #b01111111111111111111111111111110) (bvsge (x!29244 lt!146181) #b00000000000000000000000000000000) (bvsge (x!29244 lt!146181) #b00000000000000000000000000000000)))))

(assert (=> b!294886 (=> (not res!154998) (not e!186406))))

(declare-fun b!294887 () Bool)

(declare-fun e!186404 () SeekEntryResult!2218)

(assert (=> b!294887 (= e!186404 e!186402)))

(declare-fun c!47518 () Bool)

(declare-fun lt!146180 () (_ BitVec 64))

(assert (=> b!294887 (= c!47518 (or (= lt!146180 k!2524) (= (bvadd lt!146180 lt!146180) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294888 () Bool)

(assert (=> b!294888 (= e!186402 (Intermediate!2218 false lt!146099 #b00000000000000000000000000000000))))

(declare-fun b!294889 () Bool)

(assert (=> b!294889 (and (bvsge (index!11044 lt!146181) #b00000000000000000000000000000000) (bvslt (index!11044 lt!146181) (size!7421 a!3312)))))

(declare-fun e!186403 () Bool)

(assert (=> b!294889 (= e!186403 (= (select (arr!7069 a!3312) (index!11044 lt!146181)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294890 () Bool)

(assert (=> b!294890 (and (bvsge (index!11044 lt!146181) #b00000000000000000000000000000000) (bvslt (index!11044 lt!146181) (size!7421 a!3312)))))

(declare-fun res!154999 () Bool)

(assert (=> b!294890 (= res!154999 (= (select (arr!7069 a!3312) (index!11044 lt!146181)) k!2524))))

(assert (=> b!294890 (=> res!154999 e!186403)))

(assert (=> b!294890 (= e!186406 e!186403)))

(declare-fun b!294891 () Bool)

(assert (=> b!294891 (= e!186405 (bvsge (x!29244 lt!146181) #b01111111111111111111111111111110))))

(declare-fun b!294892 () Bool)

(assert (=> b!294892 (= e!186404 (Intermediate!2218 true lt!146099 #b00000000000000000000000000000000))))

(declare-fun d!66893 () Bool)

(assert (=> d!66893 e!186405))

(declare-fun c!47519 () Bool)

(assert (=> d!66893 (= c!47519 (and (is-Intermediate!2218 lt!146181) (undefined!3030 lt!146181)))))

(assert (=> d!66893 (= lt!146181 e!186404)))

(declare-fun c!47520 () Bool)

(assert (=> d!66893 (= c!47520 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66893 (= lt!146180 (select (arr!7069 a!3312) lt!146099))))

(assert (=> d!66893 (validMask!0 mask!3809)))

(assert (=> d!66893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146099 k!2524 a!3312 mask!3809) lt!146181)))

(declare-fun b!294893 () Bool)

(assert (=> b!294893 (and (bvsge (index!11044 lt!146181) #b00000000000000000000000000000000) (bvslt (index!11044 lt!146181) (size!7421 a!3312)))))

(declare-fun res!155000 () Bool)

(assert (=> b!294893 (= res!155000 (= (select (arr!7069 a!3312) (index!11044 lt!146181)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294893 (=> res!155000 e!186403)))

(assert (= (and d!66893 c!47520) b!294892))

(assert (= (and d!66893 (not c!47520)) b!294887))

(assert (= (and b!294887 c!47518) b!294888))

(assert (= (and b!294887 (not c!47518)) b!294885))

(assert (= (and d!66893 c!47519) b!294891))

(assert (= (and d!66893 (not c!47519)) b!294886))

(assert (= (and b!294886 res!154998) b!294890))

(assert (= (and b!294890 (not res!154999)) b!294893))

(assert (= (and b!294893 (not res!155000)) b!294889))

(declare-fun m!308199 () Bool)

(assert (=> b!294893 m!308199))

(assert (=> b!294889 m!308199))

(assert (=> b!294885 m!308193))

(assert (=> b!294885 m!308193))

(declare-fun m!308201 () Bool)

(assert (=> b!294885 m!308201))

(declare-fun m!308203 () Bool)

(assert (=> d!66893 m!308203))

(assert (=> d!66893 m!308089))

(assert (=> b!294890 m!308199))

(assert (=> b!294690 d!66893))

(declare-fun d!66895 () Bool)

(declare-fun lt!146193 () (_ BitVec 32))

(declare-fun lt!146192 () (_ BitVec 32))

(assert (=> d!66895 (= lt!146193 (bvmul (bvxor lt!146192 (bvlshr lt!146192 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66895 (= lt!146192 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66895 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!155001 (let ((h!5285 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29250 (bvmul (bvxor h!5285 (bvlshr h!5285 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29250 (bvlshr x!29250 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!155001 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!155001 #b00000000000000000000000000000000))))))

(assert (=> d!66895 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!146193 (bvlshr lt!146193 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294690 d!66895))

(declare-fun d!66897 () Bool)

(assert (=> d!66897 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28970 d!66897))

(declare-fun d!66901 () Bool)

(assert (=> d!66901 (= (array_inv!5032 a!3312) (bvsge (size!7421 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28970 d!66901))

(push 1)

