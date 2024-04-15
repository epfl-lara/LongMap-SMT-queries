; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93244 () Bool)

(assert start!93244)

(declare-fun b!1057088 () Bool)

(declare-fun res!705873 () Bool)

(declare-fun e!601131 () Bool)

(assert (=> b!1057088 (=> (not res!705873) (not e!601131))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057088 (= res!705873 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057089 () Bool)

(declare-fun e!601128 () Bool)

(declare-fun e!601127 () Bool)

(assert (=> b!1057089 (= e!601128 e!601127)))

(declare-fun res!705878 () Bool)

(assert (=> b!1057089 (=> (not res!705878) (not e!601127))))

(declare-fun lt!466164 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057089 (= res!705878 (not (= lt!466164 i!1381)))))

(declare-datatypes ((array!66623 0))(
  ( (array!66624 (arr!32034 (Array (_ BitVec 32) (_ BitVec 64))) (size!32572 (_ BitVec 32))) )
))
(declare-fun lt!466167 () array!66623)

(declare-fun arrayScanForKey!0 (array!66623 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057089 (= lt!466164 (arrayScanForKey!0 lt!466167 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057090 () Bool)

(declare-fun res!705872 () Bool)

(assert (=> b!1057090 (=> (not res!705872) (not e!601131))))

(declare-fun a!3488 () array!66623)

(assert (=> b!1057090 (= res!705872 (= (select (arr!32034 a!3488) i!1381) k0!2747))))

(declare-fun b!1057091 () Bool)

(declare-fun e!601130 () Bool)

(declare-fun arrayContainsKey!0 (array!66623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057091 (= e!601130 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057093 () Bool)

(declare-fun res!705874 () Bool)

(assert (=> b!1057093 (=> (not res!705874) (not e!601131))))

(declare-datatypes ((List!22405 0))(
  ( (Nil!22402) (Cons!22401 (h!23610 (_ BitVec 64)) (t!31703 List!22405)) )
))
(declare-fun arrayNoDuplicates!0 (array!66623 (_ BitVec 32) List!22405) Bool)

(assert (=> b!1057093 (= res!705874 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22402))))

(declare-fun b!1057094 () Bool)

(declare-fun e!601129 () Bool)

(assert (=> b!1057094 (= e!601129 e!601130)))

(declare-fun res!705876 () Bool)

(assert (=> b!1057094 (=> res!705876 e!601130)))

(assert (=> b!1057094 (= res!705876 (or (bvsgt lt!466164 i!1381) (bvsle i!1381 lt!466164)))))

(declare-fun b!1057095 () Bool)

(declare-fun e!601125 () Bool)

(assert (=> b!1057095 (= e!601127 (not e!601125))))

(declare-fun res!705875 () Bool)

(assert (=> b!1057095 (=> res!705875 e!601125)))

(assert (=> b!1057095 (= res!705875 (or (bvsgt lt!466164 i!1381) (bvsle i!1381 lt!466164)))))

(assert (=> b!1057095 e!601129))

(declare-fun res!705880 () Bool)

(assert (=> b!1057095 (=> (not res!705880) (not e!601129))))

(assert (=> b!1057095 (= res!705880 (= (select (store (arr!32034 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466164) k0!2747))))

(declare-fun b!1057096 () Bool)

(assert (=> b!1057096 (= e!601131 e!601128)))

(declare-fun res!705877 () Bool)

(assert (=> b!1057096 (=> (not res!705877) (not e!601128))))

(assert (=> b!1057096 (= res!705877 (arrayContainsKey!0 lt!466167 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057096 (= lt!466167 (array!66624 (store (arr!32034 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32572 a!3488)))))

(declare-fun res!705879 () Bool)

(assert (=> start!93244 (=> (not res!705879) (not e!601131))))

(assert (=> start!93244 (= res!705879 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32572 a!3488)) (bvslt (size!32572 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93244 e!601131))

(assert (=> start!93244 true))

(declare-fun array_inv!24817 (array!66623) Bool)

(assert (=> start!93244 (array_inv!24817 a!3488)))

(declare-fun b!1057092 () Bool)

(assert (=> b!1057092 (= e!601125 true)))

(declare-fun lt!466165 () (_ BitVec 32))

(assert (=> b!1057092 (arrayContainsKey!0 a!3488 k0!2747 lt!466165)))

(declare-datatypes ((Unit!34523 0))(
  ( (Unit!34524) )
))
(declare-fun lt!466168 () Unit!34523)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66623 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34523)

(assert (=> b!1057092 (= lt!466168 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466165))))

(assert (=> b!1057092 (= lt!466165 (bvadd #b00000000000000000000000000000001 lt!466164))))

(assert (=> b!1057092 (arrayNoDuplicates!0 a!3488 lt!466164 Nil!22402)))

(declare-fun lt!466166 () Unit!34523)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66623 (_ BitVec 32) (_ BitVec 32)) Unit!34523)

(assert (=> b!1057092 (= lt!466166 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466164))))

(assert (= (and start!93244 res!705879) b!1057093))

(assert (= (and b!1057093 res!705874) b!1057088))

(assert (= (and b!1057088 res!705873) b!1057090))

(assert (= (and b!1057090 res!705872) b!1057096))

(assert (= (and b!1057096 res!705877) b!1057089))

(assert (= (and b!1057089 res!705878) b!1057095))

(assert (= (and b!1057095 res!705880) b!1057094))

(assert (= (and b!1057094 (not res!705876)) b!1057091))

(assert (= (and b!1057095 (not res!705875)) b!1057092))

(declare-fun m!976319 () Bool)

(assert (=> b!1057095 m!976319))

(declare-fun m!976321 () Bool)

(assert (=> b!1057095 m!976321))

(declare-fun m!976323 () Bool)

(assert (=> b!1057092 m!976323))

(declare-fun m!976325 () Bool)

(assert (=> b!1057092 m!976325))

(declare-fun m!976327 () Bool)

(assert (=> b!1057092 m!976327))

(declare-fun m!976329 () Bool)

(assert (=> b!1057092 m!976329))

(declare-fun m!976331 () Bool)

(assert (=> b!1057089 m!976331))

(declare-fun m!976333 () Bool)

(assert (=> b!1057090 m!976333))

(declare-fun m!976335 () Bool)

(assert (=> b!1057096 m!976335))

(assert (=> b!1057096 m!976319))

(declare-fun m!976337 () Bool)

(assert (=> b!1057091 m!976337))

(declare-fun m!976339 () Bool)

(assert (=> start!93244 m!976339))

(declare-fun m!976341 () Bool)

(assert (=> b!1057088 m!976341))

(declare-fun m!976343 () Bool)

(assert (=> b!1057093 m!976343))

(check-sat (not b!1057091) (not b!1057096) (not b!1057088) (not start!93244) (not b!1057092) (not b!1057093) (not b!1057089))
(check-sat)
