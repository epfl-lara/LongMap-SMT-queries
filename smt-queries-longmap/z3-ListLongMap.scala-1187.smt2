; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25466 () Bool)

(assert start!25466)

(declare-fun b!265073 () Bool)

(declare-fun res!129559 () Bool)

(declare-fun e!171665 () Bool)

(assert (=> b!265073 (=> (not res!129559) (not e!171665))))

(declare-datatypes ((array!12757 0))(
  ( (array!12758 (arr!6037 (Array (_ BitVec 32) (_ BitVec 64))) (size!6389 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12757)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12757 (_ BitVec 32)) Bool)

(assert (=> b!265073 (= res!129559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265075 () Bool)

(declare-fun res!129561 () Bool)

(declare-fun e!171664 () Bool)

(assert (=> b!265075 (=> (not res!129561) (not e!171664))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265075 (= res!129561 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265076 () Bool)

(assert (=> b!265076 (= e!171664 e!171665)))

(declare-fun res!129564 () Bool)

(assert (=> b!265076 (=> (not res!129564) (not e!171665))))

(declare-datatypes ((SeekEntryResult!1193 0))(
  ( (MissingZero!1193 (index!6942 (_ BitVec 32))) (Found!1193 (index!6943 (_ BitVec 32))) (Intermediate!1193 (undefined!2005 Bool) (index!6944 (_ BitVec 32)) (x!25374 (_ BitVec 32))) (Undefined!1193) (MissingVacant!1193 (index!6945 (_ BitVec 32))) )
))
(declare-fun lt!134019 () SeekEntryResult!1193)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265076 (= res!129564 (or (= lt!134019 (MissingZero!1193 i!1355)) (= lt!134019 (MissingVacant!1193 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12757 (_ BitVec 32)) SeekEntryResult!1193)

(assert (=> b!265076 (= lt!134019 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265077 () Bool)

(declare-fun res!129560 () Bool)

(assert (=> b!265077 (=> (not res!129560) (not e!171664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265077 (= res!129560 (validKeyInArray!0 k0!2698))))

(declare-fun b!265078 () Bool)

(assert (=> b!265078 (= e!171665 (and (bvsle #b00000000000000000000000000000000 (size!6389 a!3436)) (bvsge (size!6389 a!3436) #b01111111111111111111111111111111)))))

(declare-fun res!129562 () Bool)

(assert (=> start!25466 (=> (not res!129562) (not e!171664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25466 (= res!129562 (validMask!0 mask!4002))))

(assert (=> start!25466 e!171664))

(assert (=> start!25466 true))

(declare-fun array_inv!3987 (array!12757) Bool)

(assert (=> start!25466 (array_inv!3987 a!3436)))

(declare-fun b!265074 () Bool)

(declare-fun res!129563 () Bool)

(assert (=> b!265074 (=> (not res!129563) (not e!171664))))

(assert (=> b!265074 (= res!129563 (and (= (size!6389 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6389 a!3436))))))

(assert (= (and start!25466 res!129562) b!265074))

(assert (= (and b!265074 res!129563) b!265077))

(assert (= (and b!265077 res!129560) b!265075))

(assert (= (and b!265075 res!129561) b!265076))

(assert (= (and b!265076 res!129564) b!265073))

(assert (= (and b!265073 res!129559) b!265078))

(declare-fun m!282143 () Bool)

(assert (=> b!265076 m!282143))

(declare-fun m!282145 () Bool)

(assert (=> b!265077 m!282145))

(declare-fun m!282147 () Bool)

(assert (=> b!265075 m!282147))

(declare-fun m!282149 () Bool)

(assert (=> b!265073 m!282149))

(declare-fun m!282151 () Bool)

(assert (=> start!25466 m!282151))

(declare-fun m!282153 () Bool)

(assert (=> start!25466 m!282153))

(check-sat (not b!265076) (not b!265077) (not b!265073) (not start!25466) (not b!265075))
(check-sat)
(get-model)

(declare-fun b!265123 () Bool)

(declare-fun e!171691 () Bool)

(declare-fun e!171690 () Bool)

(assert (=> b!265123 (= e!171691 e!171690)))

(declare-fun lt!134034 () (_ BitVec 64))

(assert (=> b!265123 (= lt!134034 (select (arr!6037 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8231 0))(
  ( (Unit!8232) )
))
(declare-fun lt!134033 () Unit!8231)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12757 (_ BitVec 64) (_ BitVec 32)) Unit!8231)

(assert (=> b!265123 (= lt!134033 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!134034 #b00000000000000000000000000000000))))

(assert (=> b!265123 (arrayContainsKey!0 a!3436 lt!134034 #b00000000000000000000000000000000)))

(declare-fun lt!134032 () Unit!8231)

(assert (=> b!265123 (= lt!134032 lt!134033)))

(declare-fun res!129606 () Bool)

(assert (=> b!265123 (= res!129606 (= (seekEntryOrOpen!0 (select (arr!6037 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1193 #b00000000000000000000000000000000)))))

(assert (=> b!265123 (=> (not res!129606) (not e!171690))))

(declare-fun b!265124 () Bool)

(declare-fun e!171692 () Bool)

(assert (=> b!265124 (= e!171692 e!171691)))

(declare-fun c!45310 () Bool)

(assert (=> b!265124 (= c!45310 (validKeyInArray!0 (select (arr!6037 a!3436) #b00000000000000000000000000000000)))))

(declare-fun bm!25300 () Bool)

(declare-fun call!25303 () Bool)

(assert (=> bm!25300 (= call!25303 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun d!64179 () Bool)

(declare-fun res!129605 () Bool)

(assert (=> d!64179 (=> res!129605 e!171692)))

(assert (=> d!64179 (= res!129605 (bvsge #b00000000000000000000000000000000 (size!6389 a!3436)))))

(assert (=> d!64179 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171692)))

(declare-fun b!265125 () Bool)

(assert (=> b!265125 (= e!171690 call!25303)))

(declare-fun b!265126 () Bool)

(assert (=> b!265126 (= e!171691 call!25303)))

(assert (= (and d!64179 (not res!129605)) b!265124))

(assert (= (and b!265124 c!45310) b!265123))

(assert (= (and b!265124 (not c!45310)) b!265126))

(assert (= (and b!265123 res!129606) b!265125))

(assert (= (or b!265125 b!265126) bm!25300))

(declare-fun m!282179 () Bool)

(assert (=> b!265123 m!282179))

(declare-fun m!282181 () Bool)

(assert (=> b!265123 m!282181))

(declare-fun m!282183 () Bool)

(assert (=> b!265123 m!282183))

(assert (=> b!265123 m!282179))

(declare-fun m!282185 () Bool)

(assert (=> b!265123 m!282185))

(assert (=> b!265124 m!282179))

(assert (=> b!265124 m!282179))

(declare-fun m!282187 () Bool)

(assert (=> b!265124 m!282187))

(declare-fun m!282189 () Bool)

(assert (=> bm!25300 m!282189))

(assert (=> b!265073 d!64179))

(declare-fun d!64187 () Bool)

(assert (=> d!64187 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25466 d!64187))

(declare-fun d!64191 () Bool)

(assert (=> d!64191 (= (array_inv!3987 a!3436) (bvsge (size!6389 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25466 d!64191))

(declare-fun d!64193 () Bool)

(assert (=> d!64193 (= (validKeyInArray!0 k0!2698) (and (not (= k0!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!265077 d!64193))

(declare-fun b!265193 () Bool)

(declare-fun c!45332 () Bool)

(declare-fun lt!134069 () (_ BitVec 64))

(assert (=> b!265193 (= c!45332 (= lt!134069 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171738 () SeekEntryResult!1193)

(declare-fun e!171740 () SeekEntryResult!1193)

(assert (=> b!265193 (= e!171738 e!171740)))

(declare-fun b!265194 () Bool)

(declare-fun lt!134070 () SeekEntryResult!1193)

(assert (=> b!265194 (= e!171738 (Found!1193 (index!6944 lt!134070)))))

(declare-fun b!265195 () Bool)

(assert (=> b!265195 (= e!171740 (MissingZero!1193 (index!6944 lt!134070)))))

(declare-fun d!64195 () Bool)

(declare-fun lt!134068 () SeekEntryResult!1193)

(get-info :version)

(assert (=> d!64195 (and (or ((_ is Undefined!1193) lt!134068) (not ((_ is Found!1193) lt!134068)) (and (bvsge (index!6943 lt!134068) #b00000000000000000000000000000000) (bvslt (index!6943 lt!134068) (size!6389 a!3436)))) (or ((_ is Undefined!1193) lt!134068) ((_ is Found!1193) lt!134068) (not ((_ is MissingZero!1193) lt!134068)) (and (bvsge (index!6942 lt!134068) #b00000000000000000000000000000000) (bvslt (index!6942 lt!134068) (size!6389 a!3436)))) (or ((_ is Undefined!1193) lt!134068) ((_ is Found!1193) lt!134068) ((_ is MissingZero!1193) lt!134068) (not ((_ is MissingVacant!1193) lt!134068)) (and (bvsge (index!6945 lt!134068) #b00000000000000000000000000000000) (bvslt (index!6945 lt!134068) (size!6389 a!3436)))) (or ((_ is Undefined!1193) lt!134068) (ite ((_ is Found!1193) lt!134068) (= (select (arr!6037 a!3436) (index!6943 lt!134068)) k0!2698) (ite ((_ is MissingZero!1193) lt!134068) (= (select (arr!6037 a!3436) (index!6942 lt!134068)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1193) lt!134068) (= (select (arr!6037 a!3436) (index!6945 lt!134068)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!171739 () SeekEntryResult!1193)

(assert (=> d!64195 (= lt!134068 e!171739)))

(declare-fun c!45334 () Bool)

(assert (=> d!64195 (= c!45334 (and ((_ is Intermediate!1193) lt!134070) (undefined!2005 lt!134070)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12757 (_ BitVec 32)) SeekEntryResult!1193)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64195 (= lt!134070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2698 mask!4002) k0!2698 a!3436 mask!4002))))

(assert (=> d!64195 (validMask!0 mask!4002)))

(assert (=> d!64195 (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) lt!134068)))

(declare-fun b!265196 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12757 (_ BitVec 32)) SeekEntryResult!1193)

(assert (=> b!265196 (= e!171740 (seekKeyOrZeroReturnVacant!0 (x!25374 lt!134070) (index!6944 lt!134070) (index!6944 lt!134070) k0!2698 a!3436 mask!4002))))

(declare-fun b!265197 () Bool)

(assert (=> b!265197 (= e!171739 e!171738)))

(assert (=> b!265197 (= lt!134069 (select (arr!6037 a!3436) (index!6944 lt!134070)))))

(declare-fun c!45333 () Bool)

(assert (=> b!265197 (= c!45333 (= lt!134069 k0!2698))))

(declare-fun b!265198 () Bool)

(assert (=> b!265198 (= e!171739 Undefined!1193)))

(assert (= (and d!64195 c!45334) b!265198))

(assert (= (and d!64195 (not c!45334)) b!265197))

(assert (= (and b!265197 c!45333) b!265194))

(assert (= (and b!265197 (not c!45333)) b!265193))

(assert (= (and b!265193 c!45332) b!265195))

(assert (= (and b!265193 (not c!45332)) b!265196))

(assert (=> d!64195 m!282151))

(declare-fun m!282233 () Bool)

(assert (=> d!64195 m!282233))

(declare-fun m!282235 () Bool)

(assert (=> d!64195 m!282235))

(declare-fun m!282237 () Bool)

(assert (=> d!64195 m!282237))

(assert (=> d!64195 m!282237))

(declare-fun m!282239 () Bool)

(assert (=> d!64195 m!282239))

(declare-fun m!282241 () Bool)

(assert (=> d!64195 m!282241))

(declare-fun m!282243 () Bool)

(assert (=> b!265196 m!282243))

(declare-fun m!282245 () Bool)

(assert (=> b!265197 m!282245))

(assert (=> b!265076 d!64195))

(declare-fun d!64211 () Bool)

(declare-fun res!129635 () Bool)

(declare-fun e!171745 () Bool)

(assert (=> d!64211 (=> res!129635 e!171745)))

(assert (=> d!64211 (= res!129635 (= (select (arr!6037 a!3436) #b00000000000000000000000000000000) k0!2698))))

(assert (=> d!64211 (= (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000) e!171745)))

(declare-fun b!265203 () Bool)

(declare-fun e!171746 () Bool)

(assert (=> b!265203 (= e!171745 e!171746)))

(declare-fun res!129636 () Bool)

(assert (=> b!265203 (=> (not res!129636) (not e!171746))))

(assert (=> b!265203 (= res!129636 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6389 a!3436)))))

(declare-fun b!265204 () Bool)

(assert (=> b!265204 (= e!171746 (arrayContainsKey!0 a!3436 k0!2698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64211 (not res!129635)) b!265203))

(assert (= (and b!265203 res!129636) b!265204))

(assert (=> d!64211 m!282179))

(declare-fun m!282247 () Bool)

(assert (=> b!265204 m!282247))

(assert (=> b!265075 d!64211))

(check-sat (not d!64195) (not b!265196) (not b!265124) (not b!265204) (not b!265123) (not bm!25300))
(check-sat)
