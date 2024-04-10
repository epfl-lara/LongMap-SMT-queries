; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93250 () Bool)

(assert start!93250)

(declare-fun b!1057293 () Bool)

(declare-fun res!706000 () Bool)

(declare-fun e!601260 () Bool)

(assert (=> b!1057293 (=> (not res!706000) (not e!601260))))

(declare-datatypes ((array!66688 0))(
  ( (array!66689 (arr!32067 (Array (_ BitVec 32) (_ BitVec 64))) (size!32603 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66688)

(declare-datatypes ((List!22379 0))(
  ( (Nil!22376) (Cons!22375 (h!23584 (_ BitVec 64)) (t!31686 List!22379)) )
))
(declare-fun arrayNoDuplicates!0 (array!66688 (_ BitVec 32) List!22379) Bool)

(assert (=> b!1057293 (= res!706000 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22376))))

(declare-fun b!1057294 () Bool)

(declare-fun e!601263 () Bool)

(declare-fun e!601262 () Bool)

(assert (=> b!1057294 (= e!601263 (not e!601262))))

(declare-fun res!705997 () Bool)

(assert (=> b!1057294 (=> res!705997 e!601262)))

(declare-fun lt!466398 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057294 (= res!705997 (or (bvsgt lt!466398 i!1381) (bvsle i!1381 lt!466398)))))

(declare-fun e!601258 () Bool)

(assert (=> b!1057294 e!601258))

(declare-fun res!705995 () Bool)

(assert (=> b!1057294 (=> (not res!705995) (not e!601258))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1057294 (= res!705995 (= (select (store (arr!32067 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466398) k!2747))))

(declare-fun b!1057295 () Bool)

(declare-fun e!601261 () Bool)

(assert (=> b!1057295 (= e!601258 e!601261)))

(declare-fun res!705996 () Bool)

(assert (=> b!1057295 (=> res!705996 e!601261)))

(assert (=> b!1057295 (= res!705996 (or (bvsgt lt!466398 i!1381) (bvsle i!1381 lt!466398)))))

(declare-fun b!1057296 () Bool)

(declare-fun e!601264 () Bool)

(assert (=> b!1057296 (= e!601260 e!601264)))

(declare-fun res!706001 () Bool)

(assert (=> b!1057296 (=> (not res!706001) (not e!601264))))

(declare-fun lt!466395 () array!66688)

(declare-fun arrayContainsKey!0 (array!66688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057296 (= res!706001 (arrayContainsKey!0 lt!466395 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057296 (= lt!466395 (array!66689 (store (arr!32067 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32603 a!3488)))))

(declare-fun b!1057298 () Bool)

(assert (=> b!1057298 (= e!601264 e!601263)))

(declare-fun res!705998 () Bool)

(assert (=> b!1057298 (=> (not res!705998) (not e!601263))))

(assert (=> b!1057298 (= res!705998 (not (= lt!466398 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66688 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057298 (= lt!466398 (arrayScanForKey!0 lt!466395 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057299 () Bool)

(assert (=> b!1057299 (= e!601262 true)))

(declare-fun lt!466394 () (_ BitVec 32))

(assert (=> b!1057299 (arrayContainsKey!0 a!3488 k!2747 lt!466394)))

(declare-datatypes ((Unit!34656 0))(
  ( (Unit!34657) )
))
(declare-fun lt!466397 () Unit!34656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34656)

(assert (=> b!1057299 (= lt!466397 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466394))))

(assert (=> b!1057299 (= lt!466394 (bvadd #b00000000000000000000000000000001 lt!466398))))

(assert (=> b!1057299 (arrayNoDuplicates!0 a!3488 lt!466398 Nil!22376)))

(declare-fun lt!466396 () Unit!34656)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66688 (_ BitVec 32) (_ BitVec 32)) Unit!34656)

(assert (=> b!1057299 (= lt!466396 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466398))))

(declare-fun b!1057300 () Bool)

(declare-fun res!705994 () Bool)

(assert (=> b!1057300 (=> (not res!705994) (not e!601260))))

(assert (=> b!1057300 (= res!705994 (= (select (arr!32067 a!3488) i!1381) k!2747))))

(declare-fun b!1057301 () Bool)

(declare-fun res!705999 () Bool)

(assert (=> b!1057301 (=> (not res!705999) (not e!601260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057301 (= res!705999 (validKeyInArray!0 k!2747))))

(declare-fun res!705993 () Bool)

(assert (=> start!93250 (=> (not res!705993) (not e!601260))))

(assert (=> start!93250 (= res!705993 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32603 a!3488)) (bvslt (size!32603 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93250 e!601260))

(assert (=> start!93250 true))

(declare-fun array_inv!24847 (array!66688) Bool)

(assert (=> start!93250 (array_inv!24847 a!3488)))

(declare-fun b!1057297 () Bool)

(assert (=> b!1057297 (= e!601261 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(assert (= (and start!93250 res!705993) b!1057293))

(assert (= (and b!1057293 res!706000) b!1057301))

(assert (= (and b!1057301 res!705999) b!1057300))

(assert (= (and b!1057300 res!705994) b!1057296))

(assert (= (and b!1057296 res!706001) b!1057298))

(assert (= (and b!1057298 res!705998) b!1057294))

(assert (= (and b!1057294 res!705995) b!1057295))

(assert (= (and b!1057295 (not res!705996)) b!1057297))

(assert (= (and b!1057294 (not res!705997)) b!1057299))

(declare-fun m!976995 () Bool)

(assert (=> start!93250 m!976995))

(declare-fun m!976997 () Bool)

(assert (=> b!1057298 m!976997))

(declare-fun m!976999 () Bool)

(assert (=> b!1057300 m!976999))

(declare-fun m!977001 () Bool)

(assert (=> b!1057301 m!977001))

(declare-fun m!977003 () Bool)

(assert (=> b!1057296 m!977003))

(declare-fun m!977005 () Bool)

(assert (=> b!1057296 m!977005))

(declare-fun m!977007 () Bool)

(assert (=> b!1057293 m!977007))

(assert (=> b!1057294 m!977005))

(declare-fun m!977009 () Bool)

(assert (=> b!1057294 m!977009))

(declare-fun m!977011 () Bool)

(assert (=> b!1057299 m!977011))

(declare-fun m!977013 () Bool)

(assert (=> b!1057299 m!977013))

(declare-fun m!977015 () Bool)

(assert (=> b!1057299 m!977015))

(declare-fun m!977017 () Bool)

(assert (=> b!1057299 m!977017))

(declare-fun m!977019 () Bool)

(assert (=> b!1057297 m!977019))

(push 1)

