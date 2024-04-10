; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92376 () Bool)

(assert start!92376)

(declare-fun b!1050288 () Bool)

(declare-fun res!699416 () Bool)

(declare-fun e!595985 () Bool)

(assert (=> b!1050288 (=> (not res!699416) (not e!595985))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050288 (= res!699416 (validKeyInArray!0 k!2747))))

(declare-fun b!1050289 () Bool)

(declare-fun e!595982 () Bool)

(assert (=> b!1050289 (= e!595982 true)))

(assert (=> b!1050289 false))

(declare-datatypes ((Unit!34376 0))(
  ( (Unit!34377) )
))
(declare-fun lt!463869 () Unit!34376)

(declare-datatypes ((array!66177 0))(
  ( (array!66178 (arr!31828 (Array (_ BitVec 32) (_ BitVec 64))) (size!32364 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66177)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((List!22140 0))(
  ( (Nil!22137) (Cons!22136 (h!23345 (_ BitVec 64)) (t!31447 List!22140)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66177 (_ BitVec 64) (_ BitVec 32) List!22140) Unit!34376)

(assert (=> b!1050289 (= lt!463869 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22137))))

(declare-fun arrayContainsKey!0 (array!66177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050289 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463872 () Unit!34376)

(declare-fun lt!463870 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66177 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34376)

(assert (=> b!1050289 (= lt!463872 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463870 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66177 (_ BitVec 32) List!22140) Bool)

(assert (=> b!1050289 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22137)))

(declare-fun lt!463868 () Unit!34376)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66177 (_ BitVec 32) (_ BitVec 32)) Unit!34376)

(assert (=> b!1050289 (= lt!463868 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!699419 () Bool)

(assert (=> start!92376 (=> (not res!699419) (not e!595985))))

(assert (=> start!92376 (= res!699419 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32364 a!3488)) (bvslt (size!32364 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92376 e!595985))

(assert (=> start!92376 true))

(declare-fun array_inv!24608 (array!66177) Bool)

(assert (=> start!92376 (array_inv!24608 a!3488)))

(declare-fun b!1050290 () Bool)

(declare-fun e!595986 () Bool)

(assert (=> b!1050290 (= e!595986 (not e!595982))))

(declare-fun res!699421 () Bool)

(assert (=> b!1050290 (=> res!699421 e!595982)))

(assert (=> b!1050290 (= res!699421 (bvsle lt!463870 i!1381))))

(declare-fun e!595984 () Bool)

(assert (=> b!1050290 e!595984))

(declare-fun res!699420 () Bool)

(assert (=> b!1050290 (=> (not res!699420) (not e!595984))))

(assert (=> b!1050290 (= res!699420 (= (select (store (arr!31828 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463870) k!2747))))

(declare-fun b!1050291 () Bool)

(declare-fun e!595981 () Bool)

(assert (=> b!1050291 (= e!595985 e!595981)))

(declare-fun res!699418 () Bool)

(assert (=> b!1050291 (=> (not res!699418) (not e!595981))))

(declare-fun lt!463871 () array!66177)

(assert (=> b!1050291 (= res!699418 (arrayContainsKey!0 lt!463871 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050291 (= lt!463871 (array!66178 (store (arr!31828 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32364 a!3488)))))

(declare-fun b!1050292 () Bool)

(declare-fun e!595983 () Bool)

(assert (=> b!1050292 (= e!595984 e!595983)))

(declare-fun res!699417 () Bool)

(assert (=> b!1050292 (=> res!699417 e!595983)))

(assert (=> b!1050292 (= res!699417 (bvsle lt!463870 i!1381))))

(declare-fun b!1050293 () Bool)

(declare-fun res!699414 () Bool)

(assert (=> b!1050293 (=> (not res!699414) (not e!595985))))

(assert (=> b!1050293 (= res!699414 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22137))))

(declare-fun b!1050294 () Bool)

(assert (=> b!1050294 (= e!595981 e!595986)))

(declare-fun res!699422 () Bool)

(assert (=> b!1050294 (=> (not res!699422) (not e!595986))))

(assert (=> b!1050294 (= res!699422 (not (= lt!463870 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66177 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050294 (= lt!463870 (arrayScanForKey!0 lt!463871 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050295 () Bool)

(assert (=> b!1050295 (= e!595983 (arrayContainsKey!0 a!3488 k!2747 lt!463870))))

(declare-fun b!1050296 () Bool)

(declare-fun res!699415 () Bool)

(assert (=> b!1050296 (=> (not res!699415) (not e!595985))))

(assert (=> b!1050296 (= res!699415 (= (select (arr!31828 a!3488) i!1381) k!2747))))

(assert (= (and start!92376 res!699419) b!1050293))

(assert (= (and b!1050293 res!699414) b!1050288))

(assert (= (and b!1050288 res!699416) b!1050296))

(assert (= (and b!1050296 res!699415) b!1050291))

(assert (= (and b!1050291 res!699418) b!1050294))

(assert (= (and b!1050294 res!699422) b!1050290))

(assert (= (and b!1050290 res!699420) b!1050292))

(assert (= (and b!1050292 (not res!699417)) b!1050295))

(assert (= (and b!1050290 (not res!699421)) b!1050289))

(declare-fun m!970961 () Bool)

(assert (=> b!1050291 m!970961))

(declare-fun m!970963 () Bool)

(assert (=> b!1050291 m!970963))

(declare-fun m!970965 () Bool)

(assert (=> b!1050296 m!970965))

(declare-fun m!970967 () Bool)

(assert (=> b!1050288 m!970967))

(declare-fun m!970969 () Bool)

(assert (=> b!1050295 m!970969))

(declare-fun m!970971 () Bool)

(assert (=> start!92376 m!970971))

(declare-fun m!970973 () Bool)

(assert (=> b!1050289 m!970973))

(declare-fun m!970975 () Bool)

(assert (=> b!1050289 m!970975))

(declare-fun m!970977 () Bool)

(assert (=> b!1050289 m!970977))

(declare-fun m!970979 () Bool)

(assert (=> b!1050289 m!970979))

(declare-fun m!970981 () Bool)

(assert (=> b!1050289 m!970981))

(assert (=> b!1050290 m!970963))

(declare-fun m!970983 () Bool)

(assert (=> b!1050290 m!970983))

(declare-fun m!970985 () Bool)

(assert (=> b!1050294 m!970985))

(declare-fun m!970987 () Bool)

(assert (=> b!1050293 m!970987))

(push 1)

(assert (not b!1050289))

(assert (not b!1050291))

(assert (not b!1050295))

(assert (not start!92376))

(assert (not b!1050293))

(assert (not b!1050288))

(assert (not b!1050294))

(check-sat)

