; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93070 () Bool)

(assert start!93070)

(declare-fun b!1055946 () Bool)

(declare-fun res!704760 () Bool)

(declare-fun e!600225 () Bool)

(assert (=> b!1055946 (=> (not res!704760) (not e!600225))))

(declare-datatypes ((array!66595 0))(
  ( (array!66596 (arr!32025 (Array (_ BitVec 32) (_ BitVec 64))) (size!32561 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66595)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055946 (= res!704760 (= (select (arr!32025 a!3488) i!1381) k!2747))))

(declare-fun b!1055947 () Bool)

(declare-fun e!600223 () Bool)

(assert (=> b!1055947 (= e!600225 e!600223)))

(declare-fun res!704767 () Bool)

(assert (=> b!1055947 (=> (not res!704767) (not e!600223))))

(declare-fun lt!465999 () array!66595)

(declare-fun arrayContainsKey!0 (array!66595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055947 (= res!704767 (arrayContainsKey!0 lt!465999 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055947 (= lt!465999 (array!66596 (store (arr!32025 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32561 a!3488)))))

(declare-fun b!1055948 () Bool)

(declare-fun e!600220 () Bool)

(declare-fun lt!465998 () (_ BitVec 32))

(assert (=> b!1055948 (= e!600220 (arrayContainsKey!0 a!3488 k!2747 lt!465998))))

(declare-fun b!1055950 () Bool)

(declare-fun e!600224 () Bool)

(assert (=> b!1055950 (= e!600224 true)))

(assert (=> b!1055950 false))

(declare-datatypes ((Unit!34608 0))(
  ( (Unit!34609) )
))
(declare-fun lt!466002 () Unit!34608)

(declare-datatypes ((List!22337 0))(
  ( (Nil!22334) (Cons!22333 (h!23542 (_ BitVec 64)) (t!31644 List!22337)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66595 (_ BitVec 64) (_ BitVec 32) List!22337) Unit!34608)

(assert (=> b!1055950 (= lt!466002 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22334))))

(assert (=> b!1055950 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!466001 () Unit!34608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66595 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34608)

(assert (=> b!1055950 (= lt!466001 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465998 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66595 (_ BitVec 32) List!22337) Bool)

(assert (=> b!1055950 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22334)))

(declare-fun lt!466000 () Unit!34608)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66595 (_ BitVec 32) (_ BitVec 32)) Unit!34608)

(assert (=> b!1055950 (= lt!466000 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055951 () Bool)

(declare-fun e!600226 () Bool)

(assert (=> b!1055951 (= e!600223 e!600226)))

(declare-fun res!704761 () Bool)

(assert (=> b!1055951 (=> (not res!704761) (not e!600226))))

(assert (=> b!1055951 (= res!704761 (not (= lt!465998 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66595 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055951 (= lt!465998 (arrayScanForKey!0 lt!465999 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055952 () Bool)

(assert (=> b!1055952 (= e!600226 (not e!600224))))

(declare-fun res!704763 () Bool)

(assert (=> b!1055952 (=> res!704763 e!600224)))

(assert (=> b!1055952 (= res!704763 (bvsle lt!465998 i!1381))))

(declare-fun e!600222 () Bool)

(assert (=> b!1055952 e!600222))

(declare-fun res!704762 () Bool)

(assert (=> b!1055952 (=> (not res!704762) (not e!600222))))

(assert (=> b!1055952 (= res!704762 (= (select (store (arr!32025 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465998) k!2747))))

(declare-fun b!1055953 () Bool)

(declare-fun res!704766 () Bool)

(assert (=> b!1055953 (=> (not res!704766) (not e!600225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055953 (= res!704766 (validKeyInArray!0 k!2747))))

(declare-fun b!1055954 () Bool)

(declare-fun res!704764 () Bool)

(assert (=> b!1055954 (=> (not res!704764) (not e!600225))))

(assert (=> b!1055954 (= res!704764 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22334))))

(declare-fun res!704768 () Bool)

(assert (=> start!93070 (=> (not res!704768) (not e!600225))))

(assert (=> start!93070 (= res!704768 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32561 a!3488)) (bvslt (size!32561 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93070 e!600225))

(assert (=> start!93070 true))

(declare-fun array_inv!24805 (array!66595) Bool)

(assert (=> start!93070 (array_inv!24805 a!3488)))

(declare-fun b!1055949 () Bool)

(assert (=> b!1055949 (= e!600222 e!600220)))

(declare-fun res!704765 () Bool)

(assert (=> b!1055949 (=> res!704765 e!600220)))

(assert (=> b!1055949 (= res!704765 (bvsle lt!465998 i!1381))))

(assert (= (and start!93070 res!704768) b!1055954))

(assert (= (and b!1055954 res!704764) b!1055953))

(assert (= (and b!1055953 res!704766) b!1055946))

(assert (= (and b!1055946 res!704760) b!1055947))

(assert (= (and b!1055947 res!704767) b!1055951))

(assert (= (and b!1055951 res!704761) b!1055952))

(assert (= (and b!1055952 res!704762) b!1055949))

(assert (= (and b!1055949 (not res!704765)) b!1055948))

(assert (= (and b!1055952 (not res!704763)) b!1055950))

(declare-fun m!975925 () Bool)

(assert (=> b!1055953 m!975925))

(declare-fun m!975927 () Bool)

(assert (=> b!1055946 m!975927))

(declare-fun m!975929 () Bool)

(assert (=> b!1055948 m!975929))

(declare-fun m!975931 () Bool)

(assert (=> b!1055951 m!975931))

(declare-fun m!975933 () Bool)

(assert (=> b!1055950 m!975933))

(declare-fun m!975935 () Bool)

(assert (=> b!1055950 m!975935))

(declare-fun m!975937 () Bool)

(assert (=> b!1055950 m!975937))

(declare-fun m!975939 () Bool)

(assert (=> b!1055950 m!975939))

(declare-fun m!975941 () Bool)

(assert (=> b!1055950 m!975941))

(declare-fun m!975943 () Bool)

(assert (=> b!1055947 m!975943))

(declare-fun m!975945 () Bool)

(assert (=> b!1055947 m!975945))

(declare-fun m!975947 () Bool)

(assert (=> b!1055954 m!975947))

(declare-fun m!975949 () Bool)

(assert (=> start!93070 m!975949))

(assert (=> b!1055952 m!975945))

(declare-fun m!975951 () Bool)

(assert (=> b!1055952 m!975951))

(push 1)

(assert (not b!1055953))

