; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93248 () Bool)

(assert start!93248)

(declare-datatypes ((array!66686 0))(
  ( (array!66687 (arr!32066 (Array (_ BitVec 32) (_ BitVec 64))) (size!32602 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66686)

(declare-fun b!1057266 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun e!601243 () Bool)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057266 (= e!601243 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun res!705970 () Bool)

(declare-fun e!601242 () Bool)

(assert (=> start!93248 (=> (not res!705970) (not e!601242))))

(assert (=> start!93248 (= res!705970 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32602 a!3488)) (bvslt (size!32602 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93248 e!601242))

(assert (=> start!93248 true))

(declare-fun array_inv!24846 (array!66686) Bool)

(assert (=> start!93248 (array_inv!24846 a!3488)))

(declare-fun b!1057267 () Bool)

(declare-fun res!705969 () Bool)

(assert (=> b!1057267 (=> (not res!705969) (not e!601242))))

(assert (=> b!1057267 (= res!705969 (= (select (arr!32066 a!3488) i!1381) k0!2747))))

(declare-fun b!1057268 () Bool)

(declare-fun e!601239 () Bool)

(assert (=> b!1057268 (= e!601239 e!601243)))

(declare-fun res!705967 () Bool)

(assert (=> b!1057268 (=> res!705967 e!601243)))

(declare-fun lt!466381 () (_ BitVec 32))

(assert (=> b!1057268 (= res!705967 (or (bvsgt lt!466381 i!1381) (bvsle i!1381 lt!466381)))))

(declare-fun b!1057269 () Bool)

(declare-fun e!601238 () Bool)

(declare-fun e!601237 () Bool)

(assert (=> b!1057269 (= e!601238 e!601237)))

(declare-fun res!705968 () Bool)

(assert (=> b!1057269 (=> (not res!705968) (not e!601237))))

(assert (=> b!1057269 (= res!705968 (not (= lt!466381 i!1381)))))

(declare-fun lt!466380 () array!66686)

(declare-fun arrayScanForKey!0 (array!66686 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057269 (= lt!466381 (arrayScanForKey!0 lt!466380 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057270 () Bool)

(declare-fun e!601241 () Bool)

(assert (=> b!1057270 (= e!601241 true)))

(declare-fun lt!466379 () (_ BitVec 32))

(assert (=> b!1057270 (arrayContainsKey!0 a!3488 k0!2747 lt!466379)))

(declare-datatypes ((Unit!34654 0))(
  ( (Unit!34655) )
))
(declare-fun lt!466383 () Unit!34654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66686 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34654)

(assert (=> b!1057270 (= lt!466383 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466379))))

(assert (=> b!1057270 (= lt!466379 (bvadd #b00000000000000000000000000000001 lt!466381))))

(declare-datatypes ((List!22378 0))(
  ( (Nil!22375) (Cons!22374 (h!23583 (_ BitVec 64)) (t!31685 List!22378)) )
))
(declare-fun arrayNoDuplicates!0 (array!66686 (_ BitVec 32) List!22378) Bool)

(assert (=> b!1057270 (arrayNoDuplicates!0 a!3488 lt!466381 Nil!22375)))

(declare-fun lt!466382 () Unit!34654)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66686 (_ BitVec 32) (_ BitVec 32)) Unit!34654)

(assert (=> b!1057270 (= lt!466382 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466381))))

(declare-fun b!1057271 () Bool)

(declare-fun res!705973 () Bool)

(assert (=> b!1057271 (=> (not res!705973) (not e!601242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057271 (= res!705973 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057272 () Bool)

(assert (=> b!1057272 (= e!601242 e!601238)))

(declare-fun res!705972 () Bool)

(assert (=> b!1057272 (=> (not res!705972) (not e!601238))))

(assert (=> b!1057272 (= res!705972 (arrayContainsKey!0 lt!466380 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057272 (= lt!466380 (array!66687 (store (arr!32066 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32602 a!3488)))))

(declare-fun b!1057273 () Bool)

(assert (=> b!1057273 (= e!601237 (not e!601241))))

(declare-fun res!705971 () Bool)

(assert (=> b!1057273 (=> res!705971 e!601241)))

(assert (=> b!1057273 (= res!705971 (or (bvsgt lt!466381 i!1381) (bvsle i!1381 lt!466381)))))

(assert (=> b!1057273 e!601239))

(declare-fun res!705974 () Bool)

(assert (=> b!1057273 (=> (not res!705974) (not e!601239))))

(assert (=> b!1057273 (= res!705974 (= (select (store (arr!32066 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466381) k0!2747))))

(declare-fun b!1057274 () Bool)

(declare-fun res!705966 () Bool)

(assert (=> b!1057274 (=> (not res!705966) (not e!601242))))

(assert (=> b!1057274 (= res!705966 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22375))))

(assert (= (and start!93248 res!705970) b!1057274))

(assert (= (and b!1057274 res!705966) b!1057271))

(assert (= (and b!1057271 res!705973) b!1057267))

(assert (= (and b!1057267 res!705969) b!1057272))

(assert (= (and b!1057272 res!705972) b!1057269))

(assert (= (and b!1057269 res!705968) b!1057273))

(assert (= (and b!1057273 res!705974) b!1057268))

(assert (= (and b!1057268 (not res!705967)) b!1057266))

(assert (= (and b!1057273 (not res!705971)) b!1057270))

(declare-fun m!976969 () Bool)

(assert (=> b!1057270 m!976969))

(declare-fun m!976971 () Bool)

(assert (=> b!1057270 m!976971))

(declare-fun m!976973 () Bool)

(assert (=> b!1057270 m!976973))

(declare-fun m!976975 () Bool)

(assert (=> b!1057270 m!976975))

(declare-fun m!976977 () Bool)

(assert (=> b!1057272 m!976977))

(declare-fun m!976979 () Bool)

(assert (=> b!1057272 m!976979))

(declare-fun m!976981 () Bool)

(assert (=> b!1057269 m!976981))

(declare-fun m!976983 () Bool)

(assert (=> b!1057274 m!976983))

(declare-fun m!976985 () Bool)

(assert (=> b!1057267 m!976985))

(assert (=> b!1057273 m!976979))

(declare-fun m!976987 () Bool)

(assert (=> b!1057273 m!976987))

(declare-fun m!976989 () Bool)

(assert (=> b!1057271 m!976989))

(declare-fun m!976991 () Bool)

(assert (=> b!1057266 m!976991))

(declare-fun m!976993 () Bool)

(assert (=> start!93248 m!976993))

(check-sat (not b!1057266) (not b!1057274) (not b!1057270) (not b!1057272) (not b!1057271) (not b!1057269) (not start!93248))
(check-sat)
