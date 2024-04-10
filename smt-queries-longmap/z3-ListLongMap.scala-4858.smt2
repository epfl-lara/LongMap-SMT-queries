; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66920 () Bool)

(assert start!66920)

(declare-fun b!772298 () Bool)

(declare-fun e!429928 () Bool)

(declare-fun e!429935 () Bool)

(assert (=> b!772298 (= e!429928 e!429935)))

(declare-fun res!522416 () Bool)

(assert (=> b!772298 (=> (not res!522416) (not e!429935))))

(declare-datatypes ((SeekEntryResult!7905 0))(
  ( (MissingZero!7905 (index!33988 (_ BitVec 32))) (Found!7905 (index!33989 (_ BitVec 32))) (Intermediate!7905 (undefined!8717 Bool) (index!33990 (_ BitVec 32)) (x!64920 (_ BitVec 32))) (Undefined!7905) (MissingVacant!7905 (index!33991 (_ BitVec 32))) )
))
(declare-fun lt!343857 () SeekEntryResult!7905)

(declare-fun lt!343854 () SeekEntryResult!7905)

(assert (=> b!772298 (= res!522416 (= lt!343857 lt!343854))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!343859 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42413 0))(
  ( (array!42414 (arr!20305 (Array (_ BitVec 32) (_ BitVec 64))) (size!20726 (_ BitVec 32))) )
))
(declare-fun lt!343849 () array!42413)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42413 (_ BitVec 32)) SeekEntryResult!7905)

(assert (=> b!772298 (= lt!343854 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343859 lt!343849 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772298 (= lt!343857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343859 mask!3328) lt!343859 lt!343849 mask!3328))))

(declare-fun a!3186 () array!42413)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!772298 (= lt!343859 (select (store (arr!20305 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!772298 (= lt!343849 (array!42414 (store (arr!20305 a!3186) i!1173 k0!2102) (size!20726 a!3186)))))

(declare-fun b!772299 () Bool)

(declare-fun e!429930 () Bool)

(declare-fun e!429929 () Bool)

(assert (=> b!772299 (= e!429930 e!429929)))

(declare-fun res!522413 () Bool)

(assert (=> b!772299 (=> (not res!522413) (not e!429929))))

(declare-fun lt!343856 () SeekEntryResult!7905)

(assert (=> b!772299 (= res!522413 (or (= lt!343856 (MissingZero!7905 i!1173)) (= lt!343856 (MissingVacant!7905 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42413 (_ BitVec 32)) SeekEntryResult!7905)

(assert (=> b!772299 (= lt!343856 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!343858 () (_ BitVec 32))

(declare-fun b!772300 () Bool)

(declare-fun e!429926 () Bool)

(assert (=> b!772300 (= e!429926 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (and (bvsge lt!343858 #b00000000000000000000000000000000) (bvslt lt!343858 (size!20726 a!3186)))))))

(declare-datatypes ((Unit!26634 0))(
  ( (Unit!26635) )
))
(declare-fun lt!343852 () Unit!26634)

(declare-fun e!429927 () Unit!26634)

(assert (=> b!772300 (= lt!343852 e!429927)))

(declare-fun c!85345 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!772300 (= c!85345 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772300 (= lt!343858 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!772301 () Bool)

(declare-fun res!522407 () Bool)

(assert (=> b!772301 (=> (not res!522407) (not e!429930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772301 (= res!522407 (validKeyInArray!0 k0!2102))))

(declare-fun b!772302 () Bool)

(declare-fun Unit!26636 () Unit!26634)

(assert (=> b!772302 (= e!429927 Unit!26636)))

(declare-fun lt!343850 () SeekEntryResult!7905)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42413 (_ BitVec 32)) SeekEntryResult!7905)

(assert (=> b!772302 (= lt!343850 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!772302 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343858 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) (Found!7905 j!159))))

(declare-fun b!772303 () Bool)

(declare-fun res!522409 () Bool)

(assert (=> b!772303 (=> (not res!522409) (not e!429930))))

(declare-fun arrayContainsKey!0 (array!42413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772303 (= res!522409 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!343851 () SeekEntryResult!7905)

(declare-fun e!429932 () Bool)

(declare-fun b!772304 () Bool)

(assert (=> b!772304 (= e!429932 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343851))))

(declare-fun b!772305 () Bool)

(declare-fun res!522412 () Bool)

(assert (=> b!772305 (=> (not res!522412) (not e!429928))))

(assert (=> b!772305 (= res!522412 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20305 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!522419 () Bool)

(assert (=> start!66920 (=> (not res!522419) (not e!429930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66920 (= res!522419 (validMask!0 mask!3328))))

(assert (=> start!66920 e!429930))

(assert (=> start!66920 true))

(declare-fun array_inv!16101 (array!42413) Bool)

(assert (=> start!66920 (array_inv!16101 a!3186)))

(declare-fun b!772306 () Bool)

(declare-fun Unit!26637 () Unit!26634)

(assert (=> b!772306 (= e!429927 Unit!26637)))

(declare-fun lt!343855 () SeekEntryResult!7905)

(assert (=> b!772306 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343858 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343855)))

(declare-fun b!772307 () Bool)

(declare-fun res!522405 () Bool)

(assert (=> b!772307 (=> (not res!522405) (not e!429929))))

(assert (=> b!772307 (= res!522405 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20726 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20726 a!3186))))))

(declare-fun b!772308 () Bool)

(declare-fun e!429933 () Bool)

(assert (=> b!772308 (= e!429933 e!429932)))

(declare-fun res!522410 () Bool)

(assert (=> b!772308 (=> (not res!522410) (not e!429932))))

(assert (=> b!772308 (= res!522410 (= (seekEntryOrOpen!0 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343851))))

(assert (=> b!772308 (= lt!343851 (Found!7905 j!159))))

(declare-fun b!772309 () Bool)

(declare-fun e!429934 () Bool)

(assert (=> b!772309 (= e!429934 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) (Found!7905 j!159)))))

(declare-fun b!772310 () Bool)

(declare-fun res!522418 () Bool)

(assert (=> b!772310 (=> (not res!522418) (not e!429929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42413 (_ BitVec 32)) Bool)

(assert (=> b!772310 (= res!522418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772311 () Bool)

(declare-fun res!522408 () Bool)

(assert (=> b!772311 (=> (not res!522408) (not e!429928))))

(assert (=> b!772311 (= res!522408 e!429934)))

(declare-fun c!85344 () Bool)

(assert (=> b!772311 (= c!85344 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772312 () Bool)

(declare-fun res!522414 () Bool)

(assert (=> b!772312 (=> (not res!522414) (not e!429930))))

(assert (=> b!772312 (= res!522414 (validKeyInArray!0 (select (arr!20305 a!3186) j!159)))))

(declare-fun b!772313 () Bool)

(assert (=> b!772313 (= e!429934 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343855))))

(declare-fun b!772314 () Bool)

(declare-fun res!522404 () Bool)

(assert (=> b!772314 (=> (not res!522404) (not e!429929))))

(declare-datatypes ((List!14307 0))(
  ( (Nil!14304) (Cons!14303 (h!15405 (_ BitVec 64)) (t!20622 List!14307)) )
))
(declare-fun arrayNoDuplicates!0 (array!42413 (_ BitVec 32) List!14307) Bool)

(assert (=> b!772314 (= res!522404 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14304))))

(declare-fun b!772315 () Bool)

(assert (=> b!772315 (= e!429929 e!429928)))

(declare-fun res!522411 () Bool)

(assert (=> b!772315 (=> (not res!522411) (not e!429928))))

(assert (=> b!772315 (= res!522411 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20305 a!3186) j!159) mask!3328) (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343855))))

(assert (=> b!772315 (= lt!343855 (Intermediate!7905 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!772316 () Bool)

(declare-fun res!522415 () Bool)

(assert (=> b!772316 (=> (not res!522415) (not e!429930))))

(assert (=> b!772316 (= res!522415 (and (= (size!20726 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20726 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20726 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772317 () Bool)

(assert (=> b!772317 (= e!429935 (not e!429926))))

(declare-fun res!522406 () Bool)

(assert (=> b!772317 (=> res!522406 e!429926)))

(get-info :version)

(assert (=> b!772317 (= res!522406 (or (not ((_ is Intermediate!7905) lt!343854)) (bvsge x!1131 (x!64920 lt!343854))))))

(assert (=> b!772317 e!429933))

(declare-fun res!522417 () Bool)

(assert (=> b!772317 (=> (not res!522417) (not e!429933))))

(assert (=> b!772317 (= res!522417 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343853 () Unit!26634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26634)

(assert (=> b!772317 (= lt!343853 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!66920 res!522419) b!772316))

(assert (= (and b!772316 res!522415) b!772312))

(assert (= (and b!772312 res!522414) b!772301))

(assert (= (and b!772301 res!522407) b!772303))

(assert (= (and b!772303 res!522409) b!772299))

(assert (= (and b!772299 res!522413) b!772310))

(assert (= (and b!772310 res!522418) b!772314))

(assert (= (and b!772314 res!522404) b!772307))

(assert (= (and b!772307 res!522405) b!772315))

(assert (= (and b!772315 res!522411) b!772305))

(assert (= (and b!772305 res!522412) b!772311))

(assert (= (and b!772311 c!85344) b!772313))

(assert (= (and b!772311 (not c!85344)) b!772309))

(assert (= (and b!772311 res!522408) b!772298))

(assert (= (and b!772298 res!522416) b!772317))

(assert (= (and b!772317 res!522417) b!772308))

(assert (= (and b!772308 res!522410) b!772304))

(assert (= (and b!772317 (not res!522406)) b!772300))

(assert (= (and b!772300 c!85345) b!772306))

(assert (= (and b!772300 (not c!85345)) b!772302))

(declare-fun m!717255 () Bool)

(assert (=> b!772305 m!717255))

(declare-fun m!717257 () Bool)

(assert (=> b!772314 m!717257))

(declare-fun m!717259 () Bool)

(assert (=> b!772313 m!717259))

(assert (=> b!772313 m!717259))

(declare-fun m!717261 () Bool)

(assert (=> b!772313 m!717261))

(assert (=> b!772308 m!717259))

(assert (=> b!772308 m!717259))

(declare-fun m!717263 () Bool)

(assert (=> b!772308 m!717263))

(declare-fun m!717265 () Bool)

(assert (=> start!66920 m!717265))

(declare-fun m!717267 () Bool)

(assert (=> start!66920 m!717267))

(declare-fun m!717269 () Bool)

(assert (=> b!772303 m!717269))

(assert (=> b!772309 m!717259))

(assert (=> b!772309 m!717259))

(declare-fun m!717271 () Bool)

(assert (=> b!772309 m!717271))

(assert (=> b!772315 m!717259))

(assert (=> b!772315 m!717259))

(declare-fun m!717273 () Bool)

(assert (=> b!772315 m!717273))

(assert (=> b!772315 m!717273))

(assert (=> b!772315 m!717259))

(declare-fun m!717275 () Bool)

(assert (=> b!772315 m!717275))

(assert (=> b!772302 m!717259))

(assert (=> b!772302 m!717259))

(assert (=> b!772302 m!717271))

(assert (=> b!772302 m!717259))

(declare-fun m!717277 () Bool)

(assert (=> b!772302 m!717277))

(assert (=> b!772306 m!717259))

(assert (=> b!772306 m!717259))

(declare-fun m!717279 () Bool)

(assert (=> b!772306 m!717279))

(declare-fun m!717281 () Bool)

(assert (=> b!772310 m!717281))

(assert (=> b!772304 m!717259))

(assert (=> b!772304 m!717259))

(declare-fun m!717283 () Bool)

(assert (=> b!772304 m!717283))

(declare-fun m!717285 () Bool)

(assert (=> b!772299 m!717285))

(declare-fun m!717287 () Bool)

(assert (=> b!772317 m!717287))

(declare-fun m!717289 () Bool)

(assert (=> b!772317 m!717289))

(declare-fun m!717291 () Bool)

(assert (=> b!772301 m!717291))

(assert (=> b!772312 m!717259))

(assert (=> b!772312 m!717259))

(declare-fun m!717293 () Bool)

(assert (=> b!772312 m!717293))

(declare-fun m!717295 () Bool)

(assert (=> b!772300 m!717295))

(declare-fun m!717297 () Bool)

(assert (=> b!772298 m!717297))

(declare-fun m!717299 () Bool)

(assert (=> b!772298 m!717299))

(declare-fun m!717301 () Bool)

(assert (=> b!772298 m!717301))

(declare-fun m!717303 () Bool)

(assert (=> b!772298 m!717303))

(assert (=> b!772298 m!717297))

(declare-fun m!717305 () Bool)

(assert (=> b!772298 m!717305))

(check-sat (not b!772315) (not b!772309) (not b!772300) (not b!772304) (not b!772303) (not b!772308) (not b!772299) (not b!772298) (not b!772302) (not b!772306) (not b!772310) (not b!772314) (not b!772301) (not b!772313) (not b!772317) (not b!772312) (not start!66920))
(check-sat)
(get-model)

(declare-fun b!772386 () Bool)

(declare-fun e!429974 () Bool)

(declare-fun e!429973 () Bool)

(assert (=> b!772386 (= e!429974 e!429973)))

(declare-fun lt!343900 () (_ BitVec 64))

(assert (=> b!772386 (= lt!343900 (select (arr!20305 a!3186) j!159))))

(declare-fun lt!343901 () Unit!26634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42413 (_ BitVec 64) (_ BitVec 32)) Unit!26634)

(assert (=> b!772386 (= lt!343901 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343900 j!159))))

(assert (=> b!772386 (arrayContainsKey!0 a!3186 lt!343900 #b00000000000000000000000000000000)))

(declare-fun lt!343899 () Unit!26634)

(assert (=> b!772386 (= lt!343899 lt!343901)))

(declare-fun res!522473 () Bool)

(assert (=> b!772386 (= res!522473 (= (seekEntryOrOpen!0 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) (Found!7905 j!159)))))

(assert (=> b!772386 (=> (not res!522473) (not e!429973))))

(declare-fun d!101829 () Bool)

(declare-fun res!522472 () Bool)

(declare-fun e!429972 () Bool)

(assert (=> d!101829 (=> res!522472 e!429972)))

(assert (=> d!101829 (= res!522472 (bvsge j!159 (size!20726 a!3186)))))

(assert (=> d!101829 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!429972)))

(declare-fun b!772387 () Bool)

(assert (=> b!772387 (= e!429972 e!429974)))

(declare-fun c!85354 () Bool)

(assert (=> b!772387 (= c!85354 (validKeyInArray!0 (select (arr!20305 a!3186) j!159)))))

(declare-fun bm!35130 () Bool)

(declare-fun call!35133 () Bool)

(assert (=> bm!35130 (= call!35133 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!772388 () Bool)

(assert (=> b!772388 (= e!429974 call!35133)))

(declare-fun b!772389 () Bool)

(assert (=> b!772389 (= e!429973 call!35133)))

(assert (= (and d!101829 (not res!522472)) b!772387))

(assert (= (and b!772387 c!85354) b!772386))

(assert (= (and b!772387 (not c!85354)) b!772388))

(assert (= (and b!772386 res!522473) b!772389))

(assert (= (or b!772389 b!772388) bm!35130))

(assert (=> b!772386 m!717259))

(declare-fun m!717359 () Bool)

(assert (=> b!772386 m!717359))

(declare-fun m!717361 () Bool)

(assert (=> b!772386 m!717361))

(assert (=> b!772386 m!717259))

(assert (=> b!772386 m!717263))

(assert (=> b!772387 m!717259))

(assert (=> b!772387 m!717259))

(assert (=> b!772387 m!717293))

(declare-fun m!717363 () Bool)

(assert (=> bm!35130 m!717363))

(assert (=> b!772317 d!101829))

(declare-fun d!101831 () Bool)

(assert (=> d!101831 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!343904 () Unit!26634)

(declare-fun choose!38 (array!42413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26634)

(assert (=> d!101831 (= lt!343904 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101831 (validMask!0 mask!3328)))

(assert (=> d!101831 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!343904)))

(declare-fun bs!21604 () Bool)

(assert (= bs!21604 d!101831))

(assert (=> bs!21604 m!717287))

(declare-fun m!717365 () Bool)

(assert (=> bs!21604 m!717365))

(assert (=> bs!21604 m!717265))

(assert (=> b!772317 d!101831))

(declare-fun d!101833 () Bool)

(assert (=> d!101833 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66920 d!101833))

(declare-fun d!101835 () Bool)

(assert (=> d!101835 (= (array_inv!16101 a!3186) (bvsge (size!20726 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66920 d!101835))

(declare-fun b!772408 () Bool)

(declare-fun e!429989 () Bool)

(declare-fun lt!343910 () SeekEntryResult!7905)

(assert (=> b!772408 (= e!429989 (bvsge (x!64920 lt!343910) #b01111111111111111111111111111110))))

(declare-fun b!772409 () Bool)

(declare-fun e!429986 () SeekEntryResult!7905)

(assert (=> b!772409 (= e!429986 (Intermediate!7905 false lt!343858 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!772410 () Bool)

(declare-fun e!429985 () Bool)

(assert (=> b!772410 (= e!429989 e!429985)))

(declare-fun res!522482 () Bool)

(assert (=> b!772410 (= res!522482 (and ((_ is Intermediate!7905) lt!343910) (not (undefined!8717 lt!343910)) (bvslt (x!64920 lt!343910) #b01111111111111111111111111111110) (bvsge (x!64920 lt!343910) #b00000000000000000000000000000000) (bvsge (x!64920 lt!343910) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!772410 (=> (not res!522482) (not e!429985))))

(declare-fun b!772411 () Bool)

(declare-fun e!429988 () SeekEntryResult!7905)

(assert (=> b!772411 (= e!429988 (Intermediate!7905 true lt!343858 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun d!101837 () Bool)

(assert (=> d!101837 e!429989))

(declare-fun c!85362 () Bool)

(assert (=> d!101837 (= c!85362 (and ((_ is Intermediate!7905) lt!343910) (undefined!8717 lt!343910)))))

(assert (=> d!101837 (= lt!343910 e!429988)))

(declare-fun c!85363 () Bool)

(assert (=> d!101837 (= c!85363 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343909 () (_ BitVec 64))

(assert (=> d!101837 (= lt!343909 (select (arr!20305 a!3186) lt!343858))))

(assert (=> d!101837 (validMask!0 mask!3328)))

(assert (=> d!101837 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343858 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343910)))

(declare-fun b!772412 () Bool)

(assert (=> b!772412 (= e!429988 e!429986)))

(declare-fun c!85361 () Bool)

(assert (=> b!772412 (= c!85361 (or (= lt!343909 (select (arr!20305 a!3186) j!159)) (= (bvadd lt!343909 lt!343909) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772413 () Bool)

(assert (=> b!772413 (= e!429986 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343858 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20305 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772414 () Bool)

(assert (=> b!772414 (and (bvsge (index!33990 lt!343910) #b00000000000000000000000000000000) (bvslt (index!33990 lt!343910) (size!20726 a!3186)))))

(declare-fun e!429987 () Bool)

(assert (=> b!772414 (= e!429987 (= (select (arr!20305 a!3186) (index!33990 lt!343910)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772415 () Bool)

(assert (=> b!772415 (and (bvsge (index!33990 lt!343910) #b00000000000000000000000000000000) (bvslt (index!33990 lt!343910) (size!20726 a!3186)))))

(declare-fun res!522481 () Bool)

(assert (=> b!772415 (= res!522481 (= (select (arr!20305 a!3186) (index!33990 lt!343910)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772415 (=> res!522481 e!429987)))

(declare-fun b!772416 () Bool)

(assert (=> b!772416 (and (bvsge (index!33990 lt!343910) #b00000000000000000000000000000000) (bvslt (index!33990 lt!343910) (size!20726 a!3186)))))

(declare-fun res!522480 () Bool)

(assert (=> b!772416 (= res!522480 (= (select (arr!20305 a!3186) (index!33990 lt!343910)) (select (arr!20305 a!3186) j!159)))))

(assert (=> b!772416 (=> res!522480 e!429987)))

(assert (=> b!772416 (= e!429985 e!429987)))

(assert (= (and d!101837 c!85363) b!772411))

(assert (= (and d!101837 (not c!85363)) b!772412))

(assert (= (and b!772412 c!85361) b!772409))

(assert (= (and b!772412 (not c!85361)) b!772413))

(assert (= (and d!101837 c!85362) b!772408))

(assert (= (and d!101837 (not c!85362)) b!772410))

(assert (= (and b!772410 res!522482) b!772416))

(assert (= (and b!772416 (not res!522480)) b!772415))

(assert (= (and b!772415 (not res!522481)) b!772414))

(declare-fun m!717367 () Bool)

(assert (=> d!101837 m!717367))

(assert (=> d!101837 m!717265))

(declare-fun m!717369 () Bool)

(assert (=> b!772414 m!717369))

(declare-fun m!717371 () Bool)

(assert (=> b!772413 m!717371))

(assert (=> b!772413 m!717371))

(assert (=> b!772413 m!717259))

(declare-fun m!717373 () Bool)

(assert (=> b!772413 m!717373))

(assert (=> b!772415 m!717369))

(assert (=> b!772416 m!717369))

(assert (=> b!772306 d!101837))

(declare-fun b!772417 () Bool)

(declare-fun e!429994 () Bool)

(declare-fun lt!343912 () SeekEntryResult!7905)

(assert (=> b!772417 (= e!429994 (bvsge (x!64920 lt!343912) #b01111111111111111111111111111110))))

(declare-fun e!429991 () SeekEntryResult!7905)

(declare-fun b!772418 () Bool)

(assert (=> b!772418 (= e!429991 (Intermediate!7905 false (toIndex!0 (select (arr!20305 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!772419 () Bool)

(declare-fun e!429990 () Bool)

(assert (=> b!772419 (= e!429994 e!429990)))

(declare-fun res!522485 () Bool)

(assert (=> b!772419 (= res!522485 (and ((_ is Intermediate!7905) lt!343912) (not (undefined!8717 lt!343912)) (bvslt (x!64920 lt!343912) #b01111111111111111111111111111110) (bvsge (x!64920 lt!343912) #b00000000000000000000000000000000) (bvsge (x!64920 lt!343912) #b00000000000000000000000000000000)))))

(assert (=> b!772419 (=> (not res!522485) (not e!429990))))

(declare-fun e!429993 () SeekEntryResult!7905)

(declare-fun b!772420 () Bool)

(assert (=> b!772420 (= e!429993 (Intermediate!7905 true (toIndex!0 (select (arr!20305 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101843 () Bool)

(assert (=> d!101843 e!429994))

(declare-fun c!85365 () Bool)

(assert (=> d!101843 (= c!85365 (and ((_ is Intermediate!7905) lt!343912) (undefined!8717 lt!343912)))))

(assert (=> d!101843 (= lt!343912 e!429993)))

(declare-fun c!85366 () Bool)

(assert (=> d!101843 (= c!85366 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!343911 () (_ BitVec 64))

(assert (=> d!101843 (= lt!343911 (select (arr!20305 a!3186) (toIndex!0 (select (arr!20305 a!3186) j!159) mask!3328)))))

(assert (=> d!101843 (validMask!0 mask!3328)))

(assert (=> d!101843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20305 a!3186) j!159) mask!3328) (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343912)))

(declare-fun b!772421 () Bool)

(assert (=> b!772421 (= e!429993 e!429991)))

(declare-fun c!85364 () Bool)

(assert (=> b!772421 (= c!85364 (or (= lt!343911 (select (arr!20305 a!3186) j!159)) (= (bvadd lt!343911 lt!343911) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772422 () Bool)

(assert (=> b!772422 (= e!429991 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20305 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20305 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772423 () Bool)

(assert (=> b!772423 (and (bvsge (index!33990 lt!343912) #b00000000000000000000000000000000) (bvslt (index!33990 lt!343912) (size!20726 a!3186)))))

(declare-fun e!429992 () Bool)

(assert (=> b!772423 (= e!429992 (= (select (arr!20305 a!3186) (index!33990 lt!343912)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772424 () Bool)

(assert (=> b!772424 (and (bvsge (index!33990 lt!343912) #b00000000000000000000000000000000) (bvslt (index!33990 lt!343912) (size!20726 a!3186)))))

(declare-fun res!522484 () Bool)

(assert (=> b!772424 (= res!522484 (= (select (arr!20305 a!3186) (index!33990 lt!343912)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772424 (=> res!522484 e!429992)))

(declare-fun b!772425 () Bool)

(assert (=> b!772425 (and (bvsge (index!33990 lt!343912) #b00000000000000000000000000000000) (bvslt (index!33990 lt!343912) (size!20726 a!3186)))))

(declare-fun res!522483 () Bool)

(assert (=> b!772425 (= res!522483 (= (select (arr!20305 a!3186) (index!33990 lt!343912)) (select (arr!20305 a!3186) j!159)))))

(assert (=> b!772425 (=> res!522483 e!429992)))

(assert (=> b!772425 (= e!429990 e!429992)))

(assert (= (and d!101843 c!85366) b!772420))

(assert (= (and d!101843 (not c!85366)) b!772421))

(assert (= (and b!772421 c!85364) b!772418))

(assert (= (and b!772421 (not c!85364)) b!772422))

(assert (= (and d!101843 c!85365) b!772417))

(assert (= (and d!101843 (not c!85365)) b!772419))

(assert (= (and b!772419 res!522485) b!772425))

(assert (= (and b!772425 (not res!522483)) b!772424))

(assert (= (and b!772424 (not res!522484)) b!772423))

(assert (=> d!101843 m!717273))

(declare-fun m!717375 () Bool)

(assert (=> d!101843 m!717375))

(assert (=> d!101843 m!717265))

(declare-fun m!717377 () Bool)

(assert (=> b!772423 m!717377))

(assert (=> b!772422 m!717273))

(declare-fun m!717379 () Bool)

(assert (=> b!772422 m!717379))

(assert (=> b!772422 m!717379))

(assert (=> b!772422 m!717259))

(declare-fun m!717381 () Bool)

(assert (=> b!772422 m!717381))

(assert (=> b!772424 m!717377))

(assert (=> b!772425 m!717377))

(assert (=> b!772315 d!101843))

(declare-fun d!101845 () Bool)

(declare-fun lt!343918 () (_ BitVec 32))

(declare-fun lt!343917 () (_ BitVec 32))

(assert (=> d!101845 (= lt!343918 (bvmul (bvxor lt!343917 (bvlshr lt!343917 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101845 (= lt!343917 ((_ extract 31 0) (bvand (bvxor (select (arr!20305 a!3186) j!159) (bvlshr (select (arr!20305 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101845 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522486 (let ((h!15407 ((_ extract 31 0) (bvand (bvxor (select (arr!20305 a!3186) j!159) (bvlshr (select (arr!20305 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64923 (bvmul (bvxor h!15407 (bvlshr h!15407 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64923 (bvlshr x!64923 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522486 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522486 #b00000000000000000000000000000000))))))

(assert (=> d!101845 (= (toIndex!0 (select (arr!20305 a!3186) j!159) mask!3328) (bvand (bvxor lt!343918 (bvlshr lt!343918 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!772315 d!101845))

(declare-fun b!772499 () Bool)

(declare-fun e!430037 () SeekEntryResult!7905)

(assert (=> b!772499 (= e!430037 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101847 () Bool)

(declare-fun lt!343938 () SeekEntryResult!7905)

(assert (=> d!101847 (and (or ((_ is Undefined!7905) lt!343938) (not ((_ is Found!7905) lt!343938)) (and (bvsge (index!33989 lt!343938) #b00000000000000000000000000000000) (bvslt (index!33989 lt!343938) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!343938) ((_ is Found!7905) lt!343938) (not ((_ is MissingVacant!7905) lt!343938)) (not (= (index!33991 lt!343938) resIntermediateIndex!5)) (and (bvsge (index!33991 lt!343938) #b00000000000000000000000000000000) (bvslt (index!33991 lt!343938) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!343938) (ite ((_ is Found!7905) lt!343938) (= (select (arr!20305 a!3186) (index!33989 lt!343938)) (select (arr!20305 a!3186) j!159)) (and ((_ is MissingVacant!7905) lt!343938) (= (index!33991 lt!343938) resIntermediateIndex!5) (= (select (arr!20305 a!3186) (index!33991 lt!343938)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!430036 () SeekEntryResult!7905)

(assert (=> d!101847 (= lt!343938 e!430036)))

(declare-fun c!85397 () Bool)

(assert (=> d!101847 (= c!85397 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!343937 () (_ BitVec 64))

(assert (=> d!101847 (= lt!343937 (select (arr!20305 a!3186) resIntermediateIndex!5))))

(assert (=> d!101847 (validMask!0 mask!3328)))

(assert (=> d!101847 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343938)))

(declare-fun b!772500 () Bool)

(declare-fun e!430038 () SeekEntryResult!7905)

(assert (=> b!772500 (= e!430036 e!430038)))

(declare-fun c!85398 () Bool)

(assert (=> b!772500 (= c!85398 (= lt!343937 (select (arr!20305 a!3186) j!159)))))

(declare-fun b!772501 () Bool)

(declare-fun c!85396 () Bool)

(assert (=> b!772501 (= c!85396 (= lt!343937 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772501 (= e!430038 e!430037)))

(declare-fun b!772502 () Bool)

(assert (=> b!772502 (= e!430036 Undefined!7905)))

(declare-fun b!772503 () Bool)

(assert (=> b!772503 (= e!430038 (Found!7905 resIntermediateIndex!5))))

(declare-fun b!772504 () Bool)

(assert (=> b!772504 (= e!430037 (MissingVacant!7905 resIntermediateIndex!5))))

(assert (= (and d!101847 c!85397) b!772502))

(assert (= (and d!101847 (not c!85397)) b!772500))

(assert (= (and b!772500 c!85398) b!772503))

(assert (= (and b!772500 (not c!85398)) b!772501))

(assert (= (and b!772501 c!85396) b!772504))

(assert (= (and b!772501 (not c!85396)) b!772499))

(declare-fun m!717409 () Bool)

(assert (=> b!772499 m!717409))

(assert (=> b!772499 m!717409))

(assert (=> b!772499 m!717259))

(declare-fun m!717411 () Bool)

(assert (=> b!772499 m!717411))

(declare-fun m!717413 () Bool)

(assert (=> d!101847 m!717413))

(declare-fun m!717415 () Bool)

(assert (=> d!101847 m!717415))

(assert (=> d!101847 m!717255))

(assert (=> d!101847 m!717265))

(assert (=> b!772304 d!101847))

(declare-fun b!772530 () Bool)

(declare-fun e!430059 () Bool)

(declare-fun call!35141 () Bool)

(assert (=> b!772530 (= e!430059 call!35141)))

(declare-fun b!772531 () Bool)

(assert (=> b!772531 (= e!430059 call!35141)))

(declare-fun b!772532 () Bool)

(declare-fun e!430060 () Bool)

(declare-fun contains!4091 (List!14307 (_ BitVec 64)) Bool)

(assert (=> b!772532 (= e!430060 (contains!4091 Nil!14304 (select (arr!20305 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772533 () Bool)

(declare-fun e!430062 () Bool)

(assert (=> b!772533 (= e!430062 e!430059)))

(declare-fun c!85404 () Bool)

(assert (=> b!772533 (= c!85404 (validKeyInArray!0 (select (arr!20305 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101855 () Bool)

(declare-fun res!522519 () Bool)

(declare-fun e!430061 () Bool)

(assert (=> d!101855 (=> res!522519 e!430061)))

(assert (=> d!101855 (= res!522519 (bvsge #b00000000000000000000000000000000 (size!20726 a!3186)))))

(assert (=> d!101855 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14304) e!430061)))

(declare-fun b!772534 () Bool)

(assert (=> b!772534 (= e!430061 e!430062)))

(declare-fun res!522520 () Bool)

(assert (=> b!772534 (=> (not res!522520) (not e!430062))))

(assert (=> b!772534 (= res!522520 (not e!430060))))

(declare-fun res!522518 () Bool)

(assert (=> b!772534 (=> (not res!522518) (not e!430060))))

(assert (=> b!772534 (= res!522518 (validKeyInArray!0 (select (arr!20305 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35138 () Bool)

(assert (=> bm!35138 (= call!35141 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85404 (Cons!14303 (select (arr!20305 a!3186) #b00000000000000000000000000000000) Nil!14304) Nil!14304)))))

(assert (= (and d!101855 (not res!522519)) b!772534))

(assert (= (and b!772534 res!522518) b!772532))

(assert (= (and b!772534 res!522520) b!772533))

(assert (= (and b!772533 c!85404) b!772530))

(assert (= (and b!772533 (not c!85404)) b!772531))

(assert (= (or b!772530 b!772531) bm!35138))

(declare-fun m!717425 () Bool)

(assert (=> b!772532 m!717425))

(assert (=> b!772532 m!717425))

(declare-fun m!717427 () Bool)

(assert (=> b!772532 m!717427))

(assert (=> b!772533 m!717425))

(assert (=> b!772533 m!717425))

(declare-fun m!717429 () Bool)

(assert (=> b!772533 m!717429))

(assert (=> b!772534 m!717425))

(assert (=> b!772534 m!717425))

(assert (=> b!772534 m!717429))

(assert (=> bm!35138 m!717425))

(declare-fun m!717431 () Bool)

(assert (=> bm!35138 m!717431))

(assert (=> b!772314 d!101855))

(declare-fun d!101861 () Bool)

(declare-fun res!522528 () Bool)

(declare-fun e!430071 () Bool)

(assert (=> d!101861 (=> res!522528 e!430071)))

(assert (=> d!101861 (= res!522528 (= (select (arr!20305 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101861 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!430071)))

(declare-fun b!772544 () Bool)

(declare-fun e!430072 () Bool)

(assert (=> b!772544 (= e!430071 e!430072)))

(declare-fun res!522529 () Bool)

(assert (=> b!772544 (=> (not res!522529) (not e!430072))))

(assert (=> b!772544 (= res!522529 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20726 a!3186)))))

(declare-fun b!772545 () Bool)

(assert (=> b!772545 (= e!430072 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101861 (not res!522528)) b!772544))

(assert (= (and b!772544 res!522529) b!772545))

(assert (=> d!101861 m!717425))

(declare-fun m!717441 () Bool)

(assert (=> b!772545 m!717441))

(assert (=> b!772303 d!101861))

(declare-fun b!772546 () Bool)

(declare-fun e!430077 () Bool)

(declare-fun lt!343946 () SeekEntryResult!7905)

(assert (=> b!772546 (= e!430077 (bvsge (x!64920 lt!343946) #b01111111111111111111111111111110))))

(declare-fun b!772547 () Bool)

(declare-fun e!430074 () SeekEntryResult!7905)

(assert (=> b!772547 (= e!430074 (Intermediate!7905 false index!1321 x!1131))))

(declare-fun b!772548 () Bool)

(declare-fun e!430073 () Bool)

(assert (=> b!772548 (= e!430077 e!430073)))

(declare-fun res!522532 () Bool)

(assert (=> b!772548 (= res!522532 (and ((_ is Intermediate!7905) lt!343946) (not (undefined!8717 lt!343946)) (bvslt (x!64920 lt!343946) #b01111111111111111111111111111110) (bvsge (x!64920 lt!343946) #b00000000000000000000000000000000) (bvsge (x!64920 lt!343946) x!1131)))))

(assert (=> b!772548 (=> (not res!522532) (not e!430073))))

(declare-fun b!772549 () Bool)

(declare-fun e!430076 () SeekEntryResult!7905)

(assert (=> b!772549 (= e!430076 (Intermediate!7905 true index!1321 x!1131))))

(declare-fun d!101865 () Bool)

(assert (=> d!101865 e!430077))

(declare-fun c!85407 () Bool)

(assert (=> d!101865 (= c!85407 (and ((_ is Intermediate!7905) lt!343946) (undefined!8717 lt!343946)))))

(assert (=> d!101865 (= lt!343946 e!430076)))

(declare-fun c!85408 () Bool)

(assert (=> d!101865 (= c!85408 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343945 () (_ BitVec 64))

(assert (=> d!101865 (= lt!343945 (select (arr!20305 a!3186) index!1321))))

(assert (=> d!101865 (validMask!0 mask!3328)))

(assert (=> d!101865 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343946)))

(declare-fun b!772550 () Bool)

(assert (=> b!772550 (= e!430076 e!430074)))

(declare-fun c!85406 () Bool)

(assert (=> b!772550 (= c!85406 (or (= lt!343945 (select (arr!20305 a!3186) j!159)) (= (bvadd lt!343945 lt!343945) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772551 () Bool)

(assert (=> b!772551 (= e!430074 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20305 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772552 () Bool)

(assert (=> b!772552 (and (bvsge (index!33990 lt!343946) #b00000000000000000000000000000000) (bvslt (index!33990 lt!343946) (size!20726 a!3186)))))

(declare-fun e!430075 () Bool)

(assert (=> b!772552 (= e!430075 (= (select (arr!20305 a!3186) (index!33990 lt!343946)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772553 () Bool)

(assert (=> b!772553 (and (bvsge (index!33990 lt!343946) #b00000000000000000000000000000000) (bvslt (index!33990 lt!343946) (size!20726 a!3186)))))

(declare-fun res!522531 () Bool)

(assert (=> b!772553 (= res!522531 (= (select (arr!20305 a!3186) (index!33990 lt!343946)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772553 (=> res!522531 e!430075)))

(declare-fun b!772554 () Bool)

(assert (=> b!772554 (and (bvsge (index!33990 lt!343946) #b00000000000000000000000000000000) (bvslt (index!33990 lt!343946) (size!20726 a!3186)))))

(declare-fun res!522530 () Bool)

(assert (=> b!772554 (= res!522530 (= (select (arr!20305 a!3186) (index!33990 lt!343946)) (select (arr!20305 a!3186) j!159)))))

(assert (=> b!772554 (=> res!522530 e!430075)))

(assert (=> b!772554 (= e!430073 e!430075)))

(assert (= (and d!101865 c!85408) b!772549))

(assert (= (and d!101865 (not c!85408)) b!772550))

(assert (= (and b!772550 c!85406) b!772547))

(assert (= (and b!772550 (not c!85406)) b!772551))

(assert (= (and d!101865 c!85407) b!772546))

(assert (= (and d!101865 (not c!85407)) b!772548))

(assert (= (and b!772548 res!522532) b!772554))

(assert (= (and b!772554 (not res!522530)) b!772553))

(assert (= (and b!772553 (not res!522531)) b!772552))

(declare-fun m!717443 () Bool)

(assert (=> d!101865 m!717443))

(assert (=> d!101865 m!717265))

(declare-fun m!717445 () Bool)

(assert (=> b!772552 m!717445))

(assert (=> b!772551 m!717295))

(assert (=> b!772551 m!717295))

(assert (=> b!772551 m!717259))

(declare-fun m!717447 () Bool)

(assert (=> b!772551 m!717447))

(assert (=> b!772553 m!717445))

(assert (=> b!772554 m!717445))

(assert (=> b!772313 d!101865))

(declare-fun b!772555 () Bool)

(declare-fun e!430079 () SeekEntryResult!7905)

(assert (=> b!772555 (= e!430079 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343948 () SeekEntryResult!7905)

(declare-fun d!101867 () Bool)

(assert (=> d!101867 (and (or ((_ is Undefined!7905) lt!343948) (not ((_ is Found!7905) lt!343948)) (and (bvsge (index!33989 lt!343948) #b00000000000000000000000000000000) (bvslt (index!33989 lt!343948) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!343948) ((_ is Found!7905) lt!343948) (not ((_ is MissingVacant!7905) lt!343948)) (not (= (index!33991 lt!343948) resIntermediateIndex!5)) (and (bvsge (index!33991 lt!343948) #b00000000000000000000000000000000) (bvslt (index!33991 lt!343948) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!343948) (ite ((_ is Found!7905) lt!343948) (= (select (arr!20305 a!3186) (index!33989 lt!343948)) (select (arr!20305 a!3186) j!159)) (and ((_ is MissingVacant!7905) lt!343948) (= (index!33991 lt!343948) resIntermediateIndex!5) (= (select (arr!20305 a!3186) (index!33991 lt!343948)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!430078 () SeekEntryResult!7905)

(assert (=> d!101867 (= lt!343948 e!430078)))

(declare-fun c!85410 () Bool)

(assert (=> d!101867 (= c!85410 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343947 () (_ BitVec 64))

(assert (=> d!101867 (= lt!343947 (select (arr!20305 a!3186) index!1321))))

(assert (=> d!101867 (validMask!0 mask!3328)))

(assert (=> d!101867 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343948)))

(declare-fun b!772556 () Bool)

(declare-fun e!430080 () SeekEntryResult!7905)

(assert (=> b!772556 (= e!430078 e!430080)))

(declare-fun c!85411 () Bool)

(assert (=> b!772556 (= c!85411 (= lt!343947 (select (arr!20305 a!3186) j!159)))))

(declare-fun b!772557 () Bool)

(declare-fun c!85409 () Bool)

(assert (=> b!772557 (= c!85409 (= lt!343947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772557 (= e!430080 e!430079)))

(declare-fun b!772558 () Bool)

(assert (=> b!772558 (= e!430078 Undefined!7905)))

(declare-fun b!772559 () Bool)

(assert (=> b!772559 (= e!430080 (Found!7905 index!1321))))

(declare-fun b!772560 () Bool)

(assert (=> b!772560 (= e!430079 (MissingVacant!7905 resIntermediateIndex!5))))

(assert (= (and d!101867 c!85410) b!772558))

(assert (= (and d!101867 (not c!85410)) b!772556))

(assert (= (and b!772556 c!85411) b!772559))

(assert (= (and b!772556 (not c!85411)) b!772557))

(assert (= (and b!772557 c!85409) b!772560))

(assert (= (and b!772557 (not c!85409)) b!772555))

(assert (=> b!772555 m!717295))

(assert (=> b!772555 m!717295))

(assert (=> b!772555 m!717259))

(declare-fun m!717449 () Bool)

(assert (=> b!772555 m!717449))

(declare-fun m!717451 () Bool)

(assert (=> d!101867 m!717451))

(declare-fun m!717453 () Bool)

(assert (=> d!101867 m!717453))

(assert (=> d!101867 m!717443))

(assert (=> d!101867 m!717265))

(assert (=> b!772302 d!101867))

(declare-fun b!772561 () Bool)

(declare-fun e!430082 () SeekEntryResult!7905)

(assert (=> b!772561 (= e!430082 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343858 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343950 () SeekEntryResult!7905)

(declare-fun d!101869 () Bool)

(assert (=> d!101869 (and (or ((_ is Undefined!7905) lt!343950) (not ((_ is Found!7905) lt!343950)) (and (bvsge (index!33989 lt!343950) #b00000000000000000000000000000000) (bvslt (index!33989 lt!343950) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!343950) ((_ is Found!7905) lt!343950) (not ((_ is MissingVacant!7905) lt!343950)) (not (= (index!33991 lt!343950) resIntermediateIndex!5)) (and (bvsge (index!33991 lt!343950) #b00000000000000000000000000000000) (bvslt (index!33991 lt!343950) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!343950) (ite ((_ is Found!7905) lt!343950) (= (select (arr!20305 a!3186) (index!33989 lt!343950)) (select (arr!20305 a!3186) j!159)) (and ((_ is MissingVacant!7905) lt!343950) (= (index!33991 lt!343950) resIntermediateIndex!5) (= (select (arr!20305 a!3186) (index!33991 lt!343950)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!430081 () SeekEntryResult!7905)

(assert (=> d!101869 (= lt!343950 e!430081)))

(declare-fun c!85413 () Bool)

(assert (=> d!101869 (= c!85413 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343949 () (_ BitVec 64))

(assert (=> d!101869 (= lt!343949 (select (arr!20305 a!3186) lt!343858))))

(assert (=> d!101869 (validMask!0 mask!3328)))

(assert (=> d!101869 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343858 resIntermediateIndex!5 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!343950)))

(declare-fun b!772562 () Bool)

(declare-fun e!430083 () SeekEntryResult!7905)

(assert (=> b!772562 (= e!430081 e!430083)))

(declare-fun c!85414 () Bool)

(assert (=> b!772562 (= c!85414 (= lt!343949 (select (arr!20305 a!3186) j!159)))))

(declare-fun b!772563 () Bool)

(declare-fun c!85412 () Bool)

(assert (=> b!772563 (= c!85412 (= lt!343949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772563 (= e!430083 e!430082)))

(declare-fun b!772564 () Bool)

(assert (=> b!772564 (= e!430081 Undefined!7905)))

(declare-fun b!772565 () Bool)

(assert (=> b!772565 (= e!430083 (Found!7905 lt!343858))))

(declare-fun b!772566 () Bool)

(assert (=> b!772566 (= e!430082 (MissingVacant!7905 resIntermediateIndex!5))))

(assert (= (and d!101869 c!85413) b!772564))

(assert (= (and d!101869 (not c!85413)) b!772562))

(assert (= (and b!772562 c!85414) b!772565))

(assert (= (and b!772562 (not c!85414)) b!772563))

(assert (= (and b!772563 c!85412) b!772566))

(assert (= (and b!772563 (not c!85412)) b!772561))

(assert (=> b!772561 m!717371))

(assert (=> b!772561 m!717371))

(assert (=> b!772561 m!717259))

(declare-fun m!717455 () Bool)

(assert (=> b!772561 m!717455))

(declare-fun m!717457 () Bool)

(assert (=> d!101869 m!717457))

(declare-fun m!717459 () Bool)

(assert (=> d!101869 m!717459))

(assert (=> d!101869 m!717367))

(assert (=> d!101869 m!717265))

(assert (=> b!772302 d!101869))

(declare-fun d!101871 () Bool)

(assert (=> d!101871 (= (validKeyInArray!0 (select (arr!20305 a!3186) j!159)) (and (not (= (select (arr!20305 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20305 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!772312 d!101871))

(declare-fun d!101873 () Bool)

(assert (=> d!101873 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!772301 d!101873))

(declare-fun d!101875 () Bool)

(declare-fun lt!343959 () (_ BitVec 32))

(assert (=> d!101875 (and (bvsge lt!343959 #b00000000000000000000000000000000) (bvslt lt!343959 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101875 (= lt!343959 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101875 (validMask!0 mask!3328)))

(assert (=> d!101875 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!343959)))

(declare-fun bs!21605 () Bool)

(assert (= bs!21605 d!101875))

(declare-fun m!717461 () Bool)

(assert (=> bs!21605 m!717461))

(assert (=> bs!21605 m!717265))

(assert (=> b!772300 d!101875))

(declare-fun b!772577 () Bool)

(declare-fun e!430092 () Bool)

(declare-fun e!430091 () Bool)

(assert (=> b!772577 (= e!430092 e!430091)))

(declare-fun lt!343965 () (_ BitVec 64))

(assert (=> b!772577 (= lt!343965 (select (arr!20305 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!343966 () Unit!26634)

(assert (=> b!772577 (= lt!343966 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343965 #b00000000000000000000000000000000))))

(assert (=> b!772577 (arrayContainsKey!0 a!3186 lt!343965 #b00000000000000000000000000000000)))

(declare-fun lt!343964 () Unit!26634)

(assert (=> b!772577 (= lt!343964 lt!343966)))

(declare-fun res!522538 () Bool)

(assert (=> b!772577 (= res!522538 (= (seekEntryOrOpen!0 (select (arr!20305 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7905 #b00000000000000000000000000000000)))))

(assert (=> b!772577 (=> (not res!522538) (not e!430091))))

(declare-fun d!101877 () Bool)

(declare-fun res!522537 () Bool)

(declare-fun e!430090 () Bool)

(assert (=> d!101877 (=> res!522537 e!430090)))

(assert (=> d!101877 (= res!522537 (bvsge #b00000000000000000000000000000000 (size!20726 a!3186)))))

(assert (=> d!101877 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!430090)))

(declare-fun b!772578 () Bool)

(assert (=> b!772578 (= e!430090 e!430092)))

(declare-fun c!85417 () Bool)

(assert (=> b!772578 (= c!85417 (validKeyInArray!0 (select (arr!20305 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35142 () Bool)

(declare-fun call!35145 () Bool)

(assert (=> bm!35142 (= call!35145 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!772579 () Bool)

(assert (=> b!772579 (= e!430092 call!35145)))

(declare-fun b!772580 () Bool)

(assert (=> b!772580 (= e!430091 call!35145)))

(assert (= (and d!101877 (not res!522537)) b!772578))

(assert (= (and b!772578 c!85417) b!772577))

(assert (= (and b!772578 (not c!85417)) b!772579))

(assert (= (and b!772577 res!522538) b!772580))

(assert (= (or b!772580 b!772579) bm!35142))

(assert (=> b!772577 m!717425))

(declare-fun m!717463 () Bool)

(assert (=> b!772577 m!717463))

(declare-fun m!717465 () Bool)

(assert (=> b!772577 m!717465))

(assert (=> b!772577 m!717425))

(declare-fun m!717467 () Bool)

(assert (=> b!772577 m!717467))

(assert (=> b!772578 m!717425))

(assert (=> b!772578 m!717425))

(assert (=> b!772578 m!717429))

(declare-fun m!717471 () Bool)

(assert (=> bm!35142 m!717471))

(assert (=> b!772310 d!101877))

(declare-fun b!772672 () Bool)

(declare-fun c!85454 () Bool)

(declare-fun lt!344002 () (_ BitVec 64))

(assert (=> b!772672 (= c!85454 (= lt!344002 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430146 () SeekEntryResult!7905)

(declare-fun e!430147 () SeekEntryResult!7905)

(assert (=> b!772672 (= e!430146 e!430147)))

(declare-fun b!772673 () Bool)

(declare-fun lt!344004 () SeekEntryResult!7905)

(assert (=> b!772673 (= e!430147 (MissingZero!7905 (index!33990 lt!344004)))))

(declare-fun d!101879 () Bool)

(declare-fun lt!344003 () SeekEntryResult!7905)

(assert (=> d!101879 (and (or ((_ is Undefined!7905) lt!344003) (not ((_ is Found!7905) lt!344003)) (and (bvsge (index!33989 lt!344003) #b00000000000000000000000000000000) (bvslt (index!33989 lt!344003) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!344003) ((_ is Found!7905) lt!344003) (not ((_ is MissingZero!7905) lt!344003)) (and (bvsge (index!33988 lt!344003) #b00000000000000000000000000000000) (bvslt (index!33988 lt!344003) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!344003) ((_ is Found!7905) lt!344003) ((_ is MissingZero!7905) lt!344003) (not ((_ is MissingVacant!7905) lt!344003)) (and (bvsge (index!33991 lt!344003) #b00000000000000000000000000000000) (bvslt (index!33991 lt!344003) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!344003) (ite ((_ is Found!7905) lt!344003) (= (select (arr!20305 a!3186) (index!33989 lt!344003)) k0!2102) (ite ((_ is MissingZero!7905) lt!344003) (= (select (arr!20305 a!3186) (index!33988 lt!344003)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7905) lt!344003) (= (select (arr!20305 a!3186) (index!33991 lt!344003)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!430145 () SeekEntryResult!7905)

(assert (=> d!101879 (= lt!344003 e!430145)))

(declare-fun c!85456 () Bool)

(assert (=> d!101879 (= c!85456 (and ((_ is Intermediate!7905) lt!344004) (undefined!8717 lt!344004)))))

(assert (=> d!101879 (= lt!344004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101879 (validMask!0 mask!3328)))

(assert (=> d!101879 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!344003)))

(declare-fun b!772674 () Bool)

(assert (=> b!772674 (= e!430147 (seekKeyOrZeroReturnVacant!0 (x!64920 lt!344004) (index!33990 lt!344004) (index!33990 lt!344004) k0!2102 a!3186 mask!3328))))

(declare-fun b!772675 () Bool)

(assert (=> b!772675 (= e!430146 (Found!7905 (index!33990 lt!344004)))))

(declare-fun b!772676 () Bool)

(assert (=> b!772676 (= e!430145 e!430146)))

(assert (=> b!772676 (= lt!344002 (select (arr!20305 a!3186) (index!33990 lt!344004)))))

(declare-fun c!85455 () Bool)

(assert (=> b!772676 (= c!85455 (= lt!344002 k0!2102))))

(declare-fun b!772677 () Bool)

(assert (=> b!772677 (= e!430145 Undefined!7905)))

(assert (= (and d!101879 c!85456) b!772677))

(assert (= (and d!101879 (not c!85456)) b!772676))

(assert (= (and b!772676 c!85455) b!772675))

(assert (= (and b!772676 (not c!85455)) b!772672))

(assert (= (and b!772672 c!85454) b!772673))

(assert (= (and b!772672 (not c!85454)) b!772674))

(declare-fun m!717515 () Bool)

(assert (=> d!101879 m!717515))

(declare-fun m!717517 () Bool)

(assert (=> d!101879 m!717517))

(assert (=> d!101879 m!717265))

(declare-fun m!717519 () Bool)

(assert (=> d!101879 m!717519))

(declare-fun m!717521 () Bool)

(assert (=> d!101879 m!717521))

(declare-fun m!717525 () Bool)

(assert (=> d!101879 m!717525))

(assert (=> d!101879 m!717519))

(declare-fun m!717527 () Bool)

(assert (=> b!772674 m!717527))

(declare-fun m!717529 () Bool)

(assert (=> b!772676 m!717529))

(assert (=> b!772299 d!101879))

(assert (=> b!772309 d!101867))

(declare-fun b!772682 () Bool)

(declare-fun e!430155 () Bool)

(declare-fun lt!344012 () SeekEntryResult!7905)

(assert (=> b!772682 (= e!430155 (bvsge (x!64920 lt!344012) #b01111111111111111111111111111110))))

(declare-fun b!772683 () Bool)

(declare-fun e!430152 () SeekEntryResult!7905)

(assert (=> b!772683 (= e!430152 (Intermediate!7905 false index!1321 x!1131))))

(declare-fun b!772684 () Bool)

(declare-fun e!430151 () Bool)

(assert (=> b!772684 (= e!430155 e!430151)))

(declare-fun res!522565 () Bool)

(assert (=> b!772684 (= res!522565 (and ((_ is Intermediate!7905) lt!344012) (not (undefined!8717 lt!344012)) (bvslt (x!64920 lt!344012) #b01111111111111111111111111111110) (bvsge (x!64920 lt!344012) #b00000000000000000000000000000000) (bvsge (x!64920 lt!344012) x!1131)))))

(assert (=> b!772684 (=> (not res!522565) (not e!430151))))

(declare-fun b!772685 () Bool)

(declare-fun e!430154 () SeekEntryResult!7905)

(assert (=> b!772685 (= e!430154 (Intermediate!7905 true index!1321 x!1131))))

(declare-fun d!101899 () Bool)

(assert (=> d!101899 e!430155))

(declare-fun c!85459 () Bool)

(assert (=> d!101899 (= c!85459 (and ((_ is Intermediate!7905) lt!344012) (undefined!8717 lt!344012)))))

(assert (=> d!101899 (= lt!344012 e!430154)))

(declare-fun c!85460 () Bool)

(assert (=> d!101899 (= c!85460 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344011 () (_ BitVec 64))

(assert (=> d!101899 (= lt!344011 (select (arr!20305 lt!343849) index!1321))))

(assert (=> d!101899 (validMask!0 mask!3328)))

(assert (=> d!101899 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343859 lt!343849 mask!3328) lt!344012)))

(declare-fun b!772686 () Bool)

(assert (=> b!772686 (= e!430154 e!430152)))

(declare-fun c!85458 () Bool)

(assert (=> b!772686 (= c!85458 (or (= lt!344011 lt!343859) (= (bvadd lt!344011 lt!344011) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772687 () Bool)

(assert (=> b!772687 (= e!430152 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!343859 lt!343849 mask!3328))))

(declare-fun b!772688 () Bool)

(assert (=> b!772688 (and (bvsge (index!33990 lt!344012) #b00000000000000000000000000000000) (bvslt (index!33990 lt!344012) (size!20726 lt!343849)))))

(declare-fun e!430153 () Bool)

(assert (=> b!772688 (= e!430153 (= (select (arr!20305 lt!343849) (index!33990 lt!344012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772689 () Bool)

(assert (=> b!772689 (and (bvsge (index!33990 lt!344012) #b00000000000000000000000000000000) (bvslt (index!33990 lt!344012) (size!20726 lt!343849)))))

(declare-fun res!522564 () Bool)

(assert (=> b!772689 (= res!522564 (= (select (arr!20305 lt!343849) (index!33990 lt!344012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772689 (=> res!522564 e!430153)))

(declare-fun b!772690 () Bool)

(assert (=> b!772690 (and (bvsge (index!33990 lt!344012) #b00000000000000000000000000000000) (bvslt (index!33990 lt!344012) (size!20726 lt!343849)))))

(declare-fun res!522563 () Bool)

(assert (=> b!772690 (= res!522563 (= (select (arr!20305 lt!343849) (index!33990 lt!344012)) lt!343859))))

(assert (=> b!772690 (=> res!522563 e!430153)))

(assert (=> b!772690 (= e!430151 e!430153)))

(assert (= (and d!101899 c!85460) b!772685))

(assert (= (and d!101899 (not c!85460)) b!772686))

(assert (= (and b!772686 c!85458) b!772683))

(assert (= (and b!772686 (not c!85458)) b!772687))

(assert (= (and d!101899 c!85459) b!772682))

(assert (= (and d!101899 (not c!85459)) b!772684))

(assert (= (and b!772684 res!522565) b!772690))

(assert (= (and b!772690 (not res!522563)) b!772689))

(assert (= (and b!772689 (not res!522564)) b!772688))

(declare-fun m!717537 () Bool)

(assert (=> d!101899 m!717537))

(assert (=> d!101899 m!717265))

(declare-fun m!717539 () Bool)

(assert (=> b!772688 m!717539))

(assert (=> b!772687 m!717295))

(assert (=> b!772687 m!717295))

(declare-fun m!717541 () Bool)

(assert (=> b!772687 m!717541))

(assert (=> b!772689 m!717539))

(assert (=> b!772690 m!717539))

(assert (=> b!772298 d!101899))

(declare-fun b!772691 () Bool)

(declare-fun e!430160 () Bool)

(declare-fun lt!344014 () SeekEntryResult!7905)

(assert (=> b!772691 (= e!430160 (bvsge (x!64920 lt!344014) #b01111111111111111111111111111110))))

(declare-fun b!772692 () Bool)

(declare-fun e!430157 () SeekEntryResult!7905)

(assert (=> b!772692 (= e!430157 (Intermediate!7905 false (toIndex!0 lt!343859 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!772693 () Bool)

(declare-fun e!430156 () Bool)

(assert (=> b!772693 (= e!430160 e!430156)))

(declare-fun res!522568 () Bool)

(assert (=> b!772693 (= res!522568 (and ((_ is Intermediate!7905) lt!344014) (not (undefined!8717 lt!344014)) (bvslt (x!64920 lt!344014) #b01111111111111111111111111111110) (bvsge (x!64920 lt!344014) #b00000000000000000000000000000000) (bvsge (x!64920 lt!344014) #b00000000000000000000000000000000)))))

(assert (=> b!772693 (=> (not res!522568) (not e!430156))))

(declare-fun b!772694 () Bool)

(declare-fun e!430159 () SeekEntryResult!7905)

(assert (=> b!772694 (= e!430159 (Intermediate!7905 true (toIndex!0 lt!343859 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101903 () Bool)

(assert (=> d!101903 e!430160))

(declare-fun c!85462 () Bool)

(assert (=> d!101903 (= c!85462 (and ((_ is Intermediate!7905) lt!344014) (undefined!8717 lt!344014)))))

(assert (=> d!101903 (= lt!344014 e!430159)))

(declare-fun c!85463 () Bool)

(assert (=> d!101903 (= c!85463 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!344013 () (_ BitVec 64))

(assert (=> d!101903 (= lt!344013 (select (arr!20305 lt!343849) (toIndex!0 lt!343859 mask!3328)))))

(assert (=> d!101903 (validMask!0 mask!3328)))

(assert (=> d!101903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343859 mask!3328) lt!343859 lt!343849 mask!3328) lt!344014)))

(declare-fun b!772695 () Bool)

(assert (=> b!772695 (= e!430159 e!430157)))

(declare-fun c!85461 () Bool)

(assert (=> b!772695 (= c!85461 (or (= lt!344013 lt!343859) (= (bvadd lt!344013 lt!344013) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772696 () Bool)

(assert (=> b!772696 (= e!430157 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!343859 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!343859 lt!343849 mask!3328))))

(declare-fun b!772697 () Bool)

(assert (=> b!772697 (and (bvsge (index!33990 lt!344014) #b00000000000000000000000000000000) (bvslt (index!33990 lt!344014) (size!20726 lt!343849)))))

(declare-fun e!430158 () Bool)

(assert (=> b!772697 (= e!430158 (= (select (arr!20305 lt!343849) (index!33990 lt!344014)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772698 () Bool)

(assert (=> b!772698 (and (bvsge (index!33990 lt!344014) #b00000000000000000000000000000000) (bvslt (index!33990 lt!344014) (size!20726 lt!343849)))))

(declare-fun res!522567 () Bool)

(assert (=> b!772698 (= res!522567 (= (select (arr!20305 lt!343849) (index!33990 lt!344014)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772698 (=> res!522567 e!430158)))

(declare-fun b!772699 () Bool)

(assert (=> b!772699 (and (bvsge (index!33990 lt!344014) #b00000000000000000000000000000000) (bvslt (index!33990 lt!344014) (size!20726 lt!343849)))))

(declare-fun res!522566 () Bool)

(assert (=> b!772699 (= res!522566 (= (select (arr!20305 lt!343849) (index!33990 lt!344014)) lt!343859))))

(assert (=> b!772699 (=> res!522566 e!430158)))

(assert (=> b!772699 (= e!430156 e!430158)))

(assert (= (and d!101903 c!85463) b!772694))

(assert (= (and d!101903 (not c!85463)) b!772695))

(assert (= (and b!772695 c!85461) b!772692))

(assert (= (and b!772695 (not c!85461)) b!772696))

(assert (= (and d!101903 c!85462) b!772691))

(assert (= (and d!101903 (not c!85462)) b!772693))

(assert (= (and b!772693 res!522568) b!772699))

(assert (= (and b!772699 (not res!522566)) b!772698))

(assert (= (and b!772698 (not res!522567)) b!772697))

(assert (=> d!101903 m!717297))

(declare-fun m!717543 () Bool)

(assert (=> d!101903 m!717543))

(assert (=> d!101903 m!717265))

(declare-fun m!717545 () Bool)

(assert (=> b!772697 m!717545))

(assert (=> b!772696 m!717297))

(declare-fun m!717548 () Bool)

(assert (=> b!772696 m!717548))

(assert (=> b!772696 m!717548))

(declare-fun m!717553 () Bool)

(assert (=> b!772696 m!717553))

(assert (=> b!772698 m!717545))

(assert (=> b!772699 m!717545))

(assert (=> b!772298 d!101903))

(declare-fun d!101905 () Bool)

(declare-fun lt!344019 () (_ BitVec 32))

(declare-fun lt!344018 () (_ BitVec 32))

(assert (=> d!101905 (= lt!344019 (bvmul (bvxor lt!344018 (bvlshr lt!344018 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101905 (= lt!344018 ((_ extract 31 0) (bvand (bvxor lt!343859 (bvlshr lt!343859 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101905 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522486 (let ((h!15407 ((_ extract 31 0) (bvand (bvxor lt!343859 (bvlshr lt!343859 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64923 (bvmul (bvxor h!15407 (bvlshr h!15407 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64923 (bvlshr x!64923 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522486 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522486 #b00000000000000000000000000000000))))))

(assert (=> d!101905 (= (toIndex!0 lt!343859 mask!3328) (bvand (bvxor lt!344019 (bvlshr lt!344019 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!772298 d!101905))

(declare-fun b!772704 () Bool)

(declare-fun c!85465 () Bool)

(declare-fun lt!344020 () (_ BitVec 64))

(assert (=> b!772704 (= c!85465 (= lt!344020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430165 () SeekEntryResult!7905)

(declare-fun e!430166 () SeekEntryResult!7905)

(assert (=> b!772704 (= e!430165 e!430166)))

(declare-fun b!772705 () Bool)

(declare-fun lt!344022 () SeekEntryResult!7905)

(assert (=> b!772705 (= e!430166 (MissingZero!7905 (index!33990 lt!344022)))))

(declare-fun d!101909 () Bool)

(declare-fun lt!344021 () SeekEntryResult!7905)

(assert (=> d!101909 (and (or ((_ is Undefined!7905) lt!344021) (not ((_ is Found!7905) lt!344021)) (and (bvsge (index!33989 lt!344021) #b00000000000000000000000000000000) (bvslt (index!33989 lt!344021) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!344021) ((_ is Found!7905) lt!344021) (not ((_ is MissingZero!7905) lt!344021)) (and (bvsge (index!33988 lt!344021) #b00000000000000000000000000000000) (bvslt (index!33988 lt!344021) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!344021) ((_ is Found!7905) lt!344021) ((_ is MissingZero!7905) lt!344021) (not ((_ is MissingVacant!7905) lt!344021)) (and (bvsge (index!33991 lt!344021) #b00000000000000000000000000000000) (bvslt (index!33991 lt!344021) (size!20726 a!3186)))) (or ((_ is Undefined!7905) lt!344021) (ite ((_ is Found!7905) lt!344021) (= (select (arr!20305 a!3186) (index!33989 lt!344021)) (select (arr!20305 a!3186) j!159)) (ite ((_ is MissingZero!7905) lt!344021) (= (select (arr!20305 a!3186) (index!33988 lt!344021)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7905) lt!344021) (= (select (arr!20305 a!3186) (index!33991 lt!344021)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!430164 () SeekEntryResult!7905)

(assert (=> d!101909 (= lt!344021 e!430164)))

(declare-fun c!85467 () Bool)

(assert (=> d!101909 (= c!85467 (and ((_ is Intermediate!7905) lt!344022) (undefined!8717 lt!344022)))))

(assert (=> d!101909 (= lt!344022 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20305 a!3186) j!159) mask!3328) (select (arr!20305 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101909 (validMask!0 mask!3328)))

(assert (=> d!101909 (= (seekEntryOrOpen!0 (select (arr!20305 a!3186) j!159) a!3186 mask!3328) lt!344021)))

(declare-fun b!772706 () Bool)

(assert (=> b!772706 (= e!430166 (seekKeyOrZeroReturnVacant!0 (x!64920 lt!344022) (index!33990 lt!344022) (index!33990 lt!344022) (select (arr!20305 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772707 () Bool)

(assert (=> b!772707 (= e!430165 (Found!7905 (index!33990 lt!344022)))))

(declare-fun b!772708 () Bool)

(assert (=> b!772708 (= e!430164 e!430165)))

(assert (=> b!772708 (= lt!344020 (select (arr!20305 a!3186) (index!33990 lt!344022)))))

(declare-fun c!85466 () Bool)

(assert (=> b!772708 (= c!85466 (= lt!344020 (select (arr!20305 a!3186) j!159)))))

(declare-fun b!772709 () Bool)

(assert (=> b!772709 (= e!430164 Undefined!7905)))

(assert (= (and d!101909 c!85467) b!772709))

(assert (= (and d!101909 (not c!85467)) b!772708))

(assert (= (and b!772708 c!85466) b!772707))

(assert (= (and b!772708 (not c!85466)) b!772704))

(assert (= (and b!772704 c!85465) b!772705))

(assert (= (and b!772704 (not c!85465)) b!772706))

(declare-fun m!717559 () Bool)

(assert (=> d!101909 m!717559))

(declare-fun m!717561 () Bool)

(assert (=> d!101909 m!717561))

(assert (=> d!101909 m!717265))

(assert (=> d!101909 m!717273))

(assert (=> d!101909 m!717259))

(assert (=> d!101909 m!717275))

(declare-fun m!717563 () Bool)

(assert (=> d!101909 m!717563))

(assert (=> d!101909 m!717259))

(assert (=> d!101909 m!717273))

(assert (=> b!772706 m!717259))

(declare-fun m!717565 () Bool)

(assert (=> b!772706 m!717565))

(declare-fun m!717567 () Bool)

(assert (=> b!772708 m!717567))

(assert (=> b!772308 d!101909))

(check-sat (not d!101865) (not d!101879) (not b!772422) (not b!772551) (not b!772578) (not b!772545) (not b!772577) (not d!101909) (not b!772413) (not b!772674) (not d!101875) (not bm!35142) (not d!101903) (not b!772561) (not b!772387) (not b!772532) (not bm!35130) (not b!772706) (not b!772386) (not b!772499) (not d!101867) (not d!101847) (not b!772696) (not b!772534) (not bm!35138) (not d!101899) (not b!772687) (not d!101843) (not b!772555) (not d!101837) (not d!101831) (not d!101869) (not b!772533))
(check-sat)
