; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93300 () Bool)

(assert start!93300)

(declare-fun res!705216 () Bool)

(declare-fun e!601024 () Bool)

(assert (=> start!93300 (=> (not res!705216) (not e!601024))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66640 0))(
  ( (array!66641 (arr!32041 (Array (_ BitVec 32) (_ BitVec 64))) (size!32578 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66640)

(assert (=> start!93300 (= res!705216 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32578 a!3488)) (bvslt (size!32578 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93300 e!601024))

(assert (=> start!93300 true))

(declare-fun array_inv!24823 (array!66640) Bool)

(assert (=> start!93300 (array_inv!24823 a!3488)))

(declare-fun lt!466486 () (_ BitVec 32))

(declare-fun e!601023 () Bool)

(declare-fun b!1057207 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057207 (= e!601023 (arrayContainsKey!0 a!3488 k0!2747 lt!466486))))

(declare-fun b!1057208 () Bool)

(declare-fun res!705221 () Bool)

(assert (=> b!1057208 (=> (not res!705221) (not e!601024))))

(assert (=> b!1057208 (= res!705221 (= (select (arr!32041 a!3488) i!1381) k0!2747))))

(declare-fun b!1057209 () Bool)

(declare-fun e!601021 () Bool)

(assert (=> b!1057209 (= e!601021 true)))

(assert (=> b!1057209 false))

(declare-datatypes ((Unit!34609 0))(
  ( (Unit!34610) )
))
(declare-fun lt!466484 () Unit!34609)

(declare-datatypes ((List!22323 0))(
  ( (Nil!22320) (Cons!22319 (h!23537 (_ BitVec 64)) (t!31622 List!22323)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66640 (_ BitVec 64) (_ BitVec 32) List!22323) Unit!34609)

(assert (=> b!1057209 (= lt!466484 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22320))))

(assert (=> b!1057209 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!466485 () Unit!34609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66640 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34609)

(assert (=> b!1057209 (= lt!466485 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466486 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66640 (_ BitVec 32) List!22323) Bool)

(assert (=> b!1057209 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22320)))

(declare-fun lt!466483 () Unit!34609)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66640 (_ BitVec 32) (_ BitVec 32)) Unit!34609)

(assert (=> b!1057209 (= lt!466483 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1057210 () Bool)

(declare-fun e!601026 () Bool)

(declare-fun e!601027 () Bool)

(assert (=> b!1057210 (= e!601026 e!601027)))

(declare-fun res!705223 () Bool)

(assert (=> b!1057210 (=> (not res!705223) (not e!601027))))

(assert (=> b!1057210 (= res!705223 (not (= lt!466486 i!1381)))))

(declare-fun lt!466487 () array!66640)

(declare-fun arrayScanForKey!0 (array!66640 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057210 (= lt!466486 (arrayScanForKey!0 lt!466487 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057211 () Bool)

(declare-fun res!705219 () Bool)

(assert (=> b!1057211 (=> (not res!705219) (not e!601024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057211 (= res!705219 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057212 () Bool)

(assert (=> b!1057212 (= e!601027 (not e!601021))))

(declare-fun res!705220 () Bool)

(assert (=> b!1057212 (=> res!705220 e!601021)))

(assert (=> b!1057212 (= res!705220 (bvsle lt!466486 i!1381))))

(declare-fun e!601022 () Bool)

(assert (=> b!1057212 e!601022))

(declare-fun res!705218 () Bool)

(assert (=> b!1057212 (=> (not res!705218) (not e!601022))))

(assert (=> b!1057212 (= res!705218 (= (select (store (arr!32041 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466486) k0!2747))))

(declare-fun b!1057213 () Bool)

(declare-fun res!705217 () Bool)

(assert (=> b!1057213 (=> (not res!705217) (not e!601024))))

(assert (=> b!1057213 (= res!705217 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22320))))

(declare-fun b!1057214 () Bool)

(assert (=> b!1057214 (= e!601024 e!601026)))

(declare-fun res!705222 () Bool)

(assert (=> b!1057214 (=> (not res!705222) (not e!601026))))

(assert (=> b!1057214 (= res!705222 (arrayContainsKey!0 lt!466487 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057214 (= lt!466487 (array!66641 (store (arr!32041 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32578 a!3488)))))

(declare-fun b!1057215 () Bool)

(assert (=> b!1057215 (= e!601022 e!601023)))

(declare-fun res!705224 () Bool)

(assert (=> b!1057215 (=> res!705224 e!601023)))

(assert (=> b!1057215 (= res!705224 (bvsle lt!466486 i!1381))))

(assert (= (and start!93300 res!705216) b!1057213))

(assert (= (and b!1057213 res!705217) b!1057211))

(assert (= (and b!1057211 res!705219) b!1057208))

(assert (= (and b!1057208 res!705221) b!1057214))

(assert (= (and b!1057214 res!705222) b!1057210))

(assert (= (and b!1057210 res!705223) b!1057212))

(assert (= (and b!1057212 res!705218) b!1057215))

(assert (= (and b!1057215 (not res!705224)) b!1057207))

(assert (= (and b!1057212 (not res!705220)) b!1057209))

(declare-fun m!977537 () Bool)

(assert (=> b!1057208 m!977537))

(declare-fun m!977539 () Bool)

(assert (=> b!1057212 m!977539))

(declare-fun m!977541 () Bool)

(assert (=> b!1057212 m!977541))

(declare-fun m!977543 () Bool)

(assert (=> b!1057210 m!977543))

(declare-fun m!977545 () Bool)

(assert (=> b!1057213 m!977545))

(declare-fun m!977547 () Bool)

(assert (=> start!93300 m!977547))

(declare-fun m!977549 () Bool)

(assert (=> b!1057211 m!977549))

(declare-fun m!977551 () Bool)

(assert (=> b!1057207 m!977551))

(declare-fun m!977553 () Bool)

(assert (=> b!1057209 m!977553))

(declare-fun m!977555 () Bool)

(assert (=> b!1057209 m!977555))

(declare-fun m!977557 () Bool)

(assert (=> b!1057209 m!977557))

(declare-fun m!977559 () Bool)

(assert (=> b!1057209 m!977559))

(declare-fun m!977561 () Bool)

(assert (=> b!1057209 m!977561))

(declare-fun m!977563 () Bool)

(assert (=> b!1057214 m!977563))

(assert (=> b!1057214 m!977539))

(check-sat (not b!1057210) (not b!1057211) (not b!1057207) (not b!1057213) (not b!1057214) (not start!93300) (not b!1057209))
(check-sat)
