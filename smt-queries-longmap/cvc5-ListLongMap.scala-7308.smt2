; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93450 () Bool)

(assert start!93450)

(declare-fun res!707101 () Bool)

(declare-fun e!602215 () Bool)

(assert (=> start!93450 (=> (not res!707101) (not e!602215))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66753 0))(
  ( (array!66754 (arr!32095 (Array (_ BitVec 32) (_ BitVec 64))) (size!32631 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66753)

(assert (=> start!93450 (= res!707101 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32631 a!3488)) (bvslt (size!32631 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93450 e!602215))

(assert (=> start!93450 true))

(declare-fun array_inv!24875 (array!66753) Bool)

(assert (=> start!93450 (array_inv!24875 a!3488)))

(declare-fun b!1058523 () Bool)

(declare-fun res!707102 () Bool)

(assert (=> b!1058523 (=> (not res!707102) (not e!602215))))

(declare-datatypes ((List!22407 0))(
  ( (Nil!22404) (Cons!22403 (h!23612 (_ BitVec 64)) (t!31714 List!22407)) )
))
(declare-fun arrayNoDuplicates!0 (array!66753 (_ BitVec 32) List!22407) Bool)

(assert (=> b!1058523 (= res!707102 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22404))))

(declare-fun b!1058524 () Bool)

(declare-fun e!602218 () Bool)

(assert (=> b!1058524 (= e!602215 e!602218)))

(declare-fun res!707100 () Bool)

(assert (=> b!1058524 (=> (not res!707100) (not e!602218))))

(declare-fun lt!466947 () array!66753)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058524 (= res!707100 (arrayContainsKey!0 lt!466947 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058524 (= lt!466947 (array!66754 (store (arr!32095 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32631 a!3488)))))

(declare-fun b!1058525 () Bool)

(declare-fun res!707104 () Bool)

(assert (=> b!1058525 (=> (not res!707104) (not e!602215))))

(assert (=> b!1058525 (= res!707104 (= (select (arr!32095 a!3488) i!1381) k!2747))))

(declare-fun b!1058526 () Bool)

(declare-fun e!602212 () Bool)

(assert (=> b!1058526 (= e!602218 e!602212)))

(declare-fun res!707103 () Bool)

(assert (=> b!1058526 (=> (not res!707103) (not e!602212))))

(declare-fun lt!466950 () (_ BitVec 32))

(assert (=> b!1058526 (= res!707103 (not (= lt!466950 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66753 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058526 (= lt!466950 (arrayScanForKey!0 lt!466947 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058527 () Bool)

(declare-fun e!602216 () Bool)

(assert (=> b!1058527 (= e!602216 true)))

(assert (=> b!1058527 (not (= (select (arr!32095 a!3488) lt!466950) k!2747))))

(declare-datatypes ((Unit!34712 0))(
  ( (Unit!34713) )
))
(declare-fun lt!466949 () Unit!34712)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66753 (_ BitVec 64) (_ BitVec 32) List!22407) Unit!34712)

(assert (=> b!1058527 (= lt!466949 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!466950 Nil!22404))))

(declare-fun lt!466948 () (_ BitVec 32))

(assert (=> b!1058527 (arrayContainsKey!0 a!3488 k!2747 lt!466948)))

(declare-fun lt!466945 () Unit!34712)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66753 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34712)

(assert (=> b!1058527 (= lt!466945 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466948))))

(assert (=> b!1058527 (= lt!466948 (bvadd #b00000000000000000000000000000001 lt!466950))))

(assert (=> b!1058527 (arrayNoDuplicates!0 a!3488 lt!466950 Nil!22404)))

(declare-fun lt!466946 () Unit!34712)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66753 (_ BitVec 32) (_ BitVec 32)) Unit!34712)

(assert (=> b!1058527 (= lt!466946 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466950))))

(declare-fun b!1058528 () Bool)

(declare-fun res!707105 () Bool)

(assert (=> b!1058528 (=> (not res!707105) (not e!602215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058528 (= res!707105 (validKeyInArray!0 k!2747))))

(declare-fun b!1058529 () Bool)

(declare-fun e!602213 () Bool)

(declare-fun e!602217 () Bool)

(assert (=> b!1058529 (= e!602213 e!602217)))

(declare-fun res!707098 () Bool)

(assert (=> b!1058529 (=> res!707098 e!602217)))

(assert (=> b!1058529 (= res!707098 (or (bvsgt lt!466950 i!1381) (bvsle i!1381 lt!466950)))))

(declare-fun b!1058530 () Bool)

(assert (=> b!1058530 (= e!602217 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1058531 () Bool)

(assert (=> b!1058531 (= e!602212 (not e!602216))))

(declare-fun res!707099 () Bool)

(assert (=> b!1058531 (=> res!707099 e!602216)))

(assert (=> b!1058531 (= res!707099 (or (bvsgt lt!466950 i!1381) (bvsle i!1381 lt!466950)))))

(assert (=> b!1058531 e!602213))

(declare-fun res!707097 () Bool)

(assert (=> b!1058531 (=> (not res!707097) (not e!602213))))

(assert (=> b!1058531 (= res!707097 (= (select (store (arr!32095 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466950) k!2747))))

(assert (= (and start!93450 res!707101) b!1058523))

(assert (= (and b!1058523 res!707102) b!1058528))

(assert (= (and b!1058528 res!707105) b!1058525))

(assert (= (and b!1058525 res!707104) b!1058524))

(assert (= (and b!1058524 res!707100) b!1058526))

(assert (= (and b!1058526 res!707103) b!1058531))

(assert (= (and b!1058531 res!707097) b!1058529))

(assert (= (and b!1058529 (not res!707098)) b!1058530))

(assert (= (and b!1058531 (not res!707099)) b!1058527))

(declare-fun m!978167 () Bool)

(assert (=> b!1058523 m!978167))

(declare-fun m!978169 () Bool)

(assert (=> b!1058525 m!978169))

(declare-fun m!978171 () Bool)

(assert (=> b!1058531 m!978171))

(declare-fun m!978173 () Bool)

(assert (=> b!1058531 m!978173))

(declare-fun m!978175 () Bool)

(assert (=> b!1058526 m!978175))

(declare-fun m!978177 () Bool)

(assert (=> b!1058530 m!978177))

(declare-fun m!978179 () Bool)

(assert (=> start!93450 m!978179))

(declare-fun m!978181 () Bool)

(assert (=> b!1058527 m!978181))

(declare-fun m!978183 () Bool)

(assert (=> b!1058527 m!978183))

(declare-fun m!978185 () Bool)

(assert (=> b!1058527 m!978185))

(declare-fun m!978187 () Bool)

(assert (=> b!1058527 m!978187))

(declare-fun m!978189 () Bool)

(assert (=> b!1058527 m!978189))

(declare-fun m!978191 () Bool)

(assert (=> b!1058527 m!978191))

(declare-fun m!978193 () Bool)

(assert (=> b!1058524 m!978193))

(assert (=> b!1058524 m!978171))

(declare-fun m!978195 () Bool)

(assert (=> b!1058528 m!978195))

(push 1)

