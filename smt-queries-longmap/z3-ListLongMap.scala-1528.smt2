; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28852 () Bool)

(assert start!28852)

(declare-fun b!294179 () Bool)

(declare-fun res!154655 () Bool)

(declare-fun e!185981 () Bool)

(assert (=> b!294179 (=> (not res!154655) (not e!185981))))

(declare-datatypes ((array!14883 0))(
  ( (array!14884 (arr!7060 (Array (_ BitVec 32) (_ BitVec 64))) (size!7412 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14883)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294179 (= res!154655 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294180 () Bool)

(declare-fun res!154654 () Bool)

(assert (=> b!294180 (=> (not res!154654) (not e!185981))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!294180 (= res!154654 (and (= (size!7412 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7412 a!3312))))))

(declare-fun b!294181 () Bool)

(declare-fun res!154658 () Bool)

(assert (=> b!294181 (=> (not res!154658) (not e!185981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294181 (= res!154658 (validKeyInArray!0 k0!2524))))

(declare-fun b!294182 () Bool)

(declare-fun e!185979 () Bool)

(assert (=> b!294182 (= e!185981 e!185979)))

(declare-fun res!154657 () Bool)

(assert (=> b!294182 (=> (not res!154657) (not e!185979))))

(declare-datatypes ((SeekEntryResult!2174 0))(
  ( (MissingZero!2174 (index!10866 (_ BitVec 32))) (Found!2174 (index!10867 (_ BitVec 32))) (Intermediate!2174 (undefined!2986 Bool) (index!10868 (_ BitVec 32)) (x!29173 (_ BitVec 32))) (Undefined!2174) (MissingVacant!2174 (index!10869 (_ BitVec 32))) )
))
(declare-fun lt!145853 () SeekEntryResult!2174)

(declare-fun lt!145850 () Bool)

(assert (=> b!294182 (= res!154657 (or lt!145850 (= lt!145853 (MissingVacant!2174 i!1256))))))

(assert (=> b!294182 (= lt!145850 (= lt!145853 (MissingZero!2174 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14883 (_ BitVec 32)) SeekEntryResult!2174)

(assert (=> b!294182 (= lt!145853 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!154659 () Bool)

(assert (=> start!28852 (=> (not res!154659) (not e!185981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28852 (= res!154659 (validMask!0 mask!3809))))

(assert (=> start!28852 e!185981))

(assert (=> start!28852 true))

(declare-fun array_inv!5010 (array!14883) Bool)

(assert (=> start!28852 (array_inv!5010 a!3312)))

(declare-fun lt!145854 () SeekEntryResult!2174)

(declare-fun b!294183 () Bool)

(get-info :version)

(assert (=> b!294183 (= e!185979 (and lt!145850 (let ((bdg!6229 (not ((_ is Intermediate!2174) lt!145854)))) (and (or bdg!6229 (not (undefined!2986 lt!145854))) (or bdg!6229 (not (= (select (arr!7060 a!3312) (index!10868 lt!145854)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6229) (or (bvslt (index!10868 lt!145854) #b00000000000000000000000000000000) (bvsge (index!10868 lt!145854) (size!7412 a!3312)))))))))

(declare-fun lt!145852 () (_ BitVec 32))

(declare-fun lt!145851 () SeekEntryResult!2174)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14883 (_ BitVec 32)) SeekEntryResult!2174)

(assert (=> b!294183 (= lt!145851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145852 k0!2524 (array!14884 (store (arr!7060 a!3312) i!1256 k0!2524) (size!7412 a!3312)) mask!3809))))

(assert (=> b!294183 (= lt!145854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145852 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294183 (= lt!145852 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!294184 () Bool)

(declare-fun res!154656 () Bool)

(assert (=> b!294184 (=> (not res!154656) (not e!185979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14883 (_ BitVec 32)) Bool)

(assert (=> b!294184 (= res!154656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28852 res!154659) b!294180))

(assert (= (and b!294180 res!154654) b!294181))

(assert (= (and b!294181 res!154658) b!294179))

(assert (= (and b!294179 res!154655) b!294182))

(assert (= (and b!294182 res!154657) b!294184))

(assert (= (and b!294184 res!154656) b!294183))

(declare-fun m!307889 () Bool)

(assert (=> b!294181 m!307889))

(declare-fun m!307891 () Bool)

(assert (=> b!294182 m!307891))

(declare-fun m!307893 () Bool)

(assert (=> b!294184 m!307893))

(declare-fun m!307895 () Bool)

(assert (=> start!28852 m!307895))

(declare-fun m!307897 () Bool)

(assert (=> start!28852 m!307897))

(declare-fun m!307899 () Bool)

(assert (=> b!294179 m!307899))

(declare-fun m!307901 () Bool)

(assert (=> b!294183 m!307901))

(declare-fun m!307903 () Bool)

(assert (=> b!294183 m!307903))

(declare-fun m!307905 () Bool)

(assert (=> b!294183 m!307905))

(declare-fun m!307907 () Bool)

(assert (=> b!294183 m!307907))

(declare-fun m!307909 () Bool)

(assert (=> b!294183 m!307909))

(check-sat (not b!294182) (not b!294184) (not b!294179) (not b!294181) (not start!28852) (not b!294183))
(check-sat)
(get-model)

(declare-fun b!294233 () Bool)

(declare-fun e!186008 () SeekEntryResult!2174)

(assert (=> b!294233 (= e!186008 Undefined!2174)))

(declare-fun b!294234 () Bool)

(declare-fun c!47341 () Bool)

(declare-fun lt!145893 () (_ BitVec 64))

(assert (=> b!294234 (= c!47341 (= lt!145893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186007 () SeekEntryResult!2174)

(declare-fun e!186006 () SeekEntryResult!2174)

(assert (=> b!294234 (= e!186007 e!186006)))

(declare-fun b!294235 () Bool)

(declare-fun lt!145891 () SeekEntryResult!2174)

(assert (=> b!294235 (= e!186007 (Found!2174 (index!10868 lt!145891)))))

(declare-fun b!294236 () Bool)

(assert (=> b!294236 (= e!186008 e!186007)))

(assert (=> b!294236 (= lt!145893 (select (arr!7060 a!3312) (index!10868 lt!145891)))))

(declare-fun c!47339 () Bool)

(assert (=> b!294236 (= c!47339 (= lt!145893 k0!2524))))

(declare-fun b!294237 () Bool)

(assert (=> b!294237 (= e!186006 (MissingZero!2174 (index!10868 lt!145891)))))

(declare-fun d!66807 () Bool)

(declare-fun lt!145892 () SeekEntryResult!2174)

(assert (=> d!66807 (and (or ((_ is Undefined!2174) lt!145892) (not ((_ is Found!2174) lt!145892)) (and (bvsge (index!10867 lt!145892) #b00000000000000000000000000000000) (bvslt (index!10867 lt!145892) (size!7412 a!3312)))) (or ((_ is Undefined!2174) lt!145892) ((_ is Found!2174) lt!145892) (not ((_ is MissingZero!2174) lt!145892)) (and (bvsge (index!10866 lt!145892) #b00000000000000000000000000000000) (bvslt (index!10866 lt!145892) (size!7412 a!3312)))) (or ((_ is Undefined!2174) lt!145892) ((_ is Found!2174) lt!145892) ((_ is MissingZero!2174) lt!145892) (not ((_ is MissingVacant!2174) lt!145892)) (and (bvsge (index!10869 lt!145892) #b00000000000000000000000000000000) (bvslt (index!10869 lt!145892) (size!7412 a!3312)))) (or ((_ is Undefined!2174) lt!145892) (ite ((_ is Found!2174) lt!145892) (= (select (arr!7060 a!3312) (index!10867 lt!145892)) k0!2524) (ite ((_ is MissingZero!2174) lt!145892) (= (select (arr!7060 a!3312) (index!10866 lt!145892)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2174) lt!145892) (= (select (arr!7060 a!3312) (index!10869 lt!145892)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66807 (= lt!145892 e!186008)))

(declare-fun c!47340 () Bool)

(assert (=> d!66807 (= c!47340 (and ((_ is Intermediate!2174) lt!145891) (undefined!2986 lt!145891)))))

(assert (=> d!66807 (= lt!145891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66807 (validMask!0 mask!3809)))

(assert (=> d!66807 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145892)))

(declare-fun b!294238 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14883 (_ BitVec 32)) SeekEntryResult!2174)

(assert (=> b!294238 (= e!186006 (seekKeyOrZeroReturnVacant!0 (x!29173 lt!145891) (index!10868 lt!145891) (index!10868 lt!145891) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66807 c!47340) b!294233))

(assert (= (and d!66807 (not c!47340)) b!294236))

(assert (= (and b!294236 c!47339) b!294235))

(assert (= (and b!294236 (not c!47339)) b!294234))

(assert (= (and b!294234 c!47341) b!294237))

(assert (= (and b!294234 (not c!47341)) b!294238))

(declare-fun m!307955 () Bool)

(assert (=> b!294236 m!307955))

(assert (=> d!66807 m!307895))

(declare-fun m!307957 () Bool)

(assert (=> d!66807 m!307957))

(assert (=> d!66807 m!307909))

(declare-fun m!307959 () Bool)

(assert (=> d!66807 m!307959))

(declare-fun m!307961 () Bool)

(assert (=> d!66807 m!307961))

(assert (=> d!66807 m!307909))

(declare-fun m!307963 () Bool)

(assert (=> d!66807 m!307963))

(declare-fun m!307965 () Bool)

(assert (=> b!294238 m!307965))

(assert (=> b!294182 d!66807))

(declare-fun b!294263 () Bool)

(declare-fun e!186026 () Bool)

(declare-fun e!186029 () Bool)

(assert (=> b!294263 (= e!186026 e!186029)))

(declare-fun res!154708 () Bool)

(declare-fun lt!145898 () SeekEntryResult!2174)

(assert (=> b!294263 (= res!154708 (and ((_ is Intermediate!2174) lt!145898) (not (undefined!2986 lt!145898)) (bvslt (x!29173 lt!145898) #b01111111111111111111111111111110) (bvsge (x!29173 lt!145898) #b00000000000000000000000000000000) (bvsge (x!29173 lt!145898) #b00000000000000000000000000000000)))))

(assert (=> b!294263 (=> (not res!154708) (not e!186029))))

(declare-fun b!294264 () Bool)

(assert (=> b!294264 (= e!186026 (bvsge (x!29173 lt!145898) #b01111111111111111111111111111110))))

(declare-fun b!294265 () Bool)

(declare-fun e!186027 () SeekEntryResult!2174)

(declare-fun e!186025 () SeekEntryResult!2174)

(assert (=> b!294265 (= e!186027 e!186025)))

(declare-fun c!47348 () Bool)

(declare-fun lt!145899 () (_ BitVec 64))

(assert (=> b!294265 (= c!47348 (or (= lt!145899 k0!2524) (= (bvadd lt!145899 lt!145899) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294266 () Bool)

(assert (=> b!294266 (and (bvsge (index!10868 lt!145898) #b00000000000000000000000000000000) (bvslt (index!10868 lt!145898) (size!7412 (array!14884 (store (arr!7060 a!3312) i!1256 k0!2524) (size!7412 a!3312)))))))

(declare-fun e!186028 () Bool)

(assert (=> b!294266 (= e!186028 (= (select (arr!7060 (array!14884 (store (arr!7060 a!3312) i!1256 k0!2524) (size!7412 a!3312))) (index!10868 lt!145898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294267 () Bool)

(assert (=> b!294267 (= e!186025 (Intermediate!2174 false lt!145852 #b00000000000000000000000000000000))))

(declare-fun b!294268 () Bool)

(assert (=> b!294268 (and (bvsge (index!10868 lt!145898) #b00000000000000000000000000000000) (bvslt (index!10868 lt!145898) (size!7412 (array!14884 (store (arr!7060 a!3312) i!1256 k0!2524) (size!7412 a!3312)))))))

(declare-fun res!154709 () Bool)

(assert (=> b!294268 (= res!154709 (= (select (arr!7060 (array!14884 (store (arr!7060 a!3312) i!1256 k0!2524) (size!7412 a!3312))) (index!10868 lt!145898)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294268 (=> res!154709 e!186028)))

(declare-fun d!66809 () Bool)

(assert (=> d!66809 e!186026))

(declare-fun c!47349 () Bool)

(assert (=> d!66809 (= c!47349 (and ((_ is Intermediate!2174) lt!145898) (undefined!2986 lt!145898)))))

(assert (=> d!66809 (= lt!145898 e!186027)))

(declare-fun c!47350 () Bool)

(assert (=> d!66809 (= c!47350 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66809 (= lt!145899 (select (arr!7060 (array!14884 (store (arr!7060 a!3312) i!1256 k0!2524) (size!7412 a!3312))) lt!145852))))

(assert (=> d!66809 (validMask!0 mask!3809)))

(assert (=> d!66809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145852 k0!2524 (array!14884 (store (arr!7060 a!3312) i!1256 k0!2524) (size!7412 a!3312)) mask!3809) lt!145898)))

(declare-fun b!294269 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294269 (= e!186025 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145852 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14884 (store (arr!7060 a!3312) i!1256 k0!2524) (size!7412 a!3312)) mask!3809))))

(declare-fun b!294270 () Bool)

(assert (=> b!294270 (and (bvsge (index!10868 lt!145898) #b00000000000000000000000000000000) (bvslt (index!10868 lt!145898) (size!7412 (array!14884 (store (arr!7060 a!3312) i!1256 k0!2524) (size!7412 a!3312)))))))

(declare-fun res!154710 () Bool)

(assert (=> b!294270 (= res!154710 (= (select (arr!7060 (array!14884 (store (arr!7060 a!3312) i!1256 k0!2524) (size!7412 a!3312))) (index!10868 lt!145898)) k0!2524))))

(assert (=> b!294270 (=> res!154710 e!186028)))

(assert (=> b!294270 (= e!186029 e!186028)))

(declare-fun b!294271 () Bool)

(assert (=> b!294271 (= e!186027 (Intermediate!2174 true lt!145852 #b00000000000000000000000000000000))))

(assert (= (and d!66809 c!47350) b!294271))

(assert (= (and d!66809 (not c!47350)) b!294265))

(assert (= (and b!294265 c!47348) b!294267))

(assert (= (and b!294265 (not c!47348)) b!294269))

(assert (= (and d!66809 c!47349) b!294264))

(assert (= (and d!66809 (not c!47349)) b!294263))

(assert (= (and b!294263 res!154708) b!294270))

(assert (= (and b!294270 (not res!154710)) b!294268))

(assert (= (and b!294268 (not res!154709)) b!294266))

(declare-fun m!307971 () Bool)

(assert (=> b!294270 m!307971))

(assert (=> b!294266 m!307971))

(declare-fun m!307973 () Bool)

(assert (=> b!294269 m!307973))

(assert (=> b!294269 m!307973))

(declare-fun m!307975 () Bool)

(assert (=> b!294269 m!307975))

(declare-fun m!307977 () Bool)

(assert (=> d!66809 m!307977))

(assert (=> d!66809 m!307895))

(assert (=> b!294268 m!307971))

(assert (=> b!294183 d!66809))

(declare-fun b!294272 () Bool)

(declare-fun e!186031 () Bool)

(declare-fun e!186034 () Bool)

(assert (=> b!294272 (= e!186031 e!186034)))

(declare-fun res!154711 () Bool)

(declare-fun lt!145900 () SeekEntryResult!2174)

(assert (=> b!294272 (= res!154711 (and ((_ is Intermediate!2174) lt!145900) (not (undefined!2986 lt!145900)) (bvslt (x!29173 lt!145900) #b01111111111111111111111111111110) (bvsge (x!29173 lt!145900) #b00000000000000000000000000000000) (bvsge (x!29173 lt!145900) #b00000000000000000000000000000000)))))

(assert (=> b!294272 (=> (not res!154711) (not e!186034))))

(declare-fun b!294273 () Bool)

(assert (=> b!294273 (= e!186031 (bvsge (x!29173 lt!145900) #b01111111111111111111111111111110))))

(declare-fun b!294274 () Bool)

(declare-fun e!186032 () SeekEntryResult!2174)

(declare-fun e!186030 () SeekEntryResult!2174)

(assert (=> b!294274 (= e!186032 e!186030)))

(declare-fun c!47351 () Bool)

(declare-fun lt!145901 () (_ BitVec 64))

(assert (=> b!294274 (= c!47351 (or (= lt!145901 k0!2524) (= (bvadd lt!145901 lt!145901) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294275 () Bool)

(assert (=> b!294275 (and (bvsge (index!10868 lt!145900) #b00000000000000000000000000000000) (bvslt (index!10868 lt!145900) (size!7412 a!3312)))))

(declare-fun e!186033 () Bool)

(assert (=> b!294275 (= e!186033 (= (select (arr!7060 a!3312) (index!10868 lt!145900)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294276 () Bool)

(assert (=> b!294276 (= e!186030 (Intermediate!2174 false lt!145852 #b00000000000000000000000000000000))))

(declare-fun b!294277 () Bool)

(assert (=> b!294277 (and (bvsge (index!10868 lt!145900) #b00000000000000000000000000000000) (bvslt (index!10868 lt!145900) (size!7412 a!3312)))))

(declare-fun res!154712 () Bool)

(assert (=> b!294277 (= res!154712 (= (select (arr!7060 a!3312) (index!10868 lt!145900)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294277 (=> res!154712 e!186033)))

(declare-fun d!66821 () Bool)

(assert (=> d!66821 e!186031))

(declare-fun c!47352 () Bool)

(assert (=> d!66821 (= c!47352 (and ((_ is Intermediate!2174) lt!145900) (undefined!2986 lt!145900)))))

(assert (=> d!66821 (= lt!145900 e!186032)))

(declare-fun c!47353 () Bool)

(assert (=> d!66821 (= c!47353 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66821 (= lt!145901 (select (arr!7060 a!3312) lt!145852))))

(assert (=> d!66821 (validMask!0 mask!3809)))

(assert (=> d!66821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145852 k0!2524 a!3312 mask!3809) lt!145900)))

(declare-fun b!294278 () Bool)

(assert (=> b!294278 (= e!186030 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145852 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!294279 () Bool)

(assert (=> b!294279 (and (bvsge (index!10868 lt!145900) #b00000000000000000000000000000000) (bvslt (index!10868 lt!145900) (size!7412 a!3312)))))

(declare-fun res!154713 () Bool)

(assert (=> b!294279 (= res!154713 (= (select (arr!7060 a!3312) (index!10868 lt!145900)) k0!2524))))

(assert (=> b!294279 (=> res!154713 e!186033)))

(assert (=> b!294279 (= e!186034 e!186033)))

(declare-fun b!294280 () Bool)

(assert (=> b!294280 (= e!186032 (Intermediate!2174 true lt!145852 #b00000000000000000000000000000000))))

(assert (= (and d!66821 c!47353) b!294280))

(assert (= (and d!66821 (not c!47353)) b!294274))

(assert (= (and b!294274 c!47351) b!294276))

(assert (= (and b!294274 (not c!47351)) b!294278))

(assert (= (and d!66821 c!47352) b!294273))

(assert (= (and d!66821 (not c!47352)) b!294272))

(assert (= (and b!294272 res!154711) b!294279))

(assert (= (and b!294279 (not res!154713)) b!294277))

(assert (= (and b!294277 (not res!154712)) b!294275))

(declare-fun m!307979 () Bool)

(assert (=> b!294279 m!307979))

(assert (=> b!294275 m!307979))

(assert (=> b!294278 m!307973))

(assert (=> b!294278 m!307973))

(declare-fun m!307981 () Bool)

(assert (=> b!294278 m!307981))

(declare-fun m!307983 () Bool)

(assert (=> d!66821 m!307983))

(assert (=> d!66821 m!307895))

(assert (=> b!294277 m!307979))

(assert (=> b!294183 d!66821))

(declare-fun d!66823 () Bool)

(declare-fun lt!145911 () (_ BitVec 32))

(declare-fun lt!145910 () (_ BitVec 32))

(assert (=> d!66823 (= lt!145911 (bvmul (bvxor lt!145910 (bvlshr lt!145910 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66823 (= lt!145910 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66823 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154714 (let ((h!5189 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29177 (bvmul (bvxor h!5189 (bvlshr h!5189 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29177 (bvlshr x!29177 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154714 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154714 #b00000000000000000000000000000000))))))

(assert (=> d!66823 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145911 (bvlshr lt!145911 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294183 d!66823))

(declare-fun d!66825 () Bool)

(assert (=> d!66825 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28852 d!66825))

(declare-fun d!66835 () Bool)

(assert (=> d!66835 (= (array_inv!5010 a!3312) (bvsge (size!7412 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28852 d!66835))

(declare-fun d!66837 () Bool)

(declare-fun res!154736 () Bool)

(declare-fun e!186063 () Bool)

(assert (=> d!66837 (=> res!154736 e!186063)))

(assert (=> d!66837 (= res!154736 (= (select (arr!7060 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66837 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186063)))

(declare-fun b!294325 () Bool)

(declare-fun e!186064 () Bool)

(assert (=> b!294325 (= e!186063 e!186064)))

(declare-fun res!154737 () Bool)

(assert (=> b!294325 (=> (not res!154737) (not e!186064))))

(assert (=> b!294325 (= res!154737 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7412 a!3312)))))

(declare-fun b!294326 () Bool)

(assert (=> b!294326 (= e!186064 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66837 (not res!154736)) b!294325))

(assert (= (and b!294325 res!154737) b!294326))

(declare-fun m!307999 () Bool)

(assert (=> d!66837 m!307999))

(declare-fun m!308001 () Bool)

(assert (=> b!294326 m!308001))

(assert (=> b!294179 d!66837))

(declare-fun bm!25683 () Bool)

(declare-fun call!25686 () Bool)

(assert (=> bm!25683 (= call!25686 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294357 () Bool)

(declare-fun e!186089 () Bool)

(assert (=> b!294357 (= e!186089 call!25686)))

(declare-fun b!294358 () Bool)

(declare-fun e!186088 () Bool)

(assert (=> b!294358 (= e!186089 e!186088)))

(declare-fun lt!145945 () (_ BitVec 64))

(assert (=> b!294358 (= lt!145945 (select (arr!7060 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9166 0))(
  ( (Unit!9167) )
))
(declare-fun lt!145944 () Unit!9166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14883 (_ BitVec 64) (_ BitVec 32)) Unit!9166)

(assert (=> b!294358 (= lt!145944 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145945 #b00000000000000000000000000000000))))

(assert (=> b!294358 (arrayContainsKey!0 a!3312 lt!145945 #b00000000000000000000000000000000)))

(declare-fun lt!145943 () Unit!9166)

(assert (=> b!294358 (= lt!145943 lt!145944)))

(declare-fun res!154754 () Bool)

(assert (=> b!294358 (= res!154754 (= (seekEntryOrOpen!0 (select (arr!7060 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2174 #b00000000000000000000000000000000)))))

(assert (=> b!294358 (=> (not res!154754) (not e!186088))))

(declare-fun b!294359 () Bool)

(declare-fun e!186090 () Bool)

(assert (=> b!294359 (= e!186090 e!186089)))

(declare-fun c!47373 () Bool)

(assert (=> b!294359 (= c!47373 (validKeyInArray!0 (select (arr!7060 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294360 () Bool)

(assert (=> b!294360 (= e!186088 call!25686)))

(declare-fun d!66841 () Bool)

(declare-fun res!154755 () Bool)

(assert (=> d!66841 (=> res!154755 e!186090)))

(assert (=> d!66841 (= res!154755 (bvsge #b00000000000000000000000000000000 (size!7412 a!3312)))))

(assert (=> d!66841 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186090)))

(assert (= (and d!66841 (not res!154755)) b!294359))

(assert (= (and b!294359 c!47373) b!294358))

(assert (= (and b!294359 (not c!47373)) b!294357))

(assert (= (and b!294358 res!154754) b!294360))

(assert (= (or b!294360 b!294357) bm!25683))

(declare-fun m!308017 () Bool)

(assert (=> bm!25683 m!308017))

(assert (=> b!294358 m!307999))

(declare-fun m!308019 () Bool)

(assert (=> b!294358 m!308019))

(declare-fun m!308021 () Bool)

(assert (=> b!294358 m!308021))

(assert (=> b!294358 m!307999))

(declare-fun m!308023 () Bool)

(assert (=> b!294358 m!308023))

(assert (=> b!294359 m!307999))

(assert (=> b!294359 m!307999))

(declare-fun m!308025 () Bool)

(assert (=> b!294359 m!308025))

(assert (=> b!294184 d!66841))

(declare-fun d!66849 () Bool)

(assert (=> d!66849 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294181 d!66849))

(check-sat (not d!66821) (not d!66807) (not bm!25683) (not d!66809) (not b!294269) (not b!294278) (not b!294326) (not b!294359) (not b!294358) (not b!294238))
(check-sat)
